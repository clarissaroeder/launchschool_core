require 'YAML'

# ------------------------ CONSTANTS ------------------------ #
MESSAGES = YAML.load_file('21_messages.yml')

GOAL = 21
MINIMUM_HIT = 17
WINNING_SCORE = 5

HEARTS = "\u2665"
DIAMONDS = "\u2666"
SPADES = "\u2660"
CLUBS = "\u2663"

RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
SUITS = [HEARTS, DIAMONDS, SPADES, CLUBS]

# ------------------------- METHODS ------------------------- #

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def blank_line(n=1)
  n.times { puts }
end

def wait
  blank_line
  print MESSAGES['wait']
  gets
end

def joinand(hand, last_value='?')
  values = hand.map { |card| "#{card[2]} #{card[1]}" }
  case values.size
  when 2
    values[-1] = " and #{last_value}"
    values.join
  else
    values[-1] = "and #{last_value}"
    values.join(', ')
  end
end

def play_again?
  print MESSAGES['again']
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# ------------ Displaying hands, scores, results ------------ #
def show_hands(player, dealer)
  show_dealer_hand(dealer)

  player_hand = joinand(player, "#{player[-1][2]} #{player[-1][1]}")
  total = total(player)
  prompt format(MESSAGES['player_hand'], hand: player_hand, total: total)
  blank_line
end

def show_dealer_hand(dealer)
  if dealer.size == 2
    dealer_hand = joinand(dealer)
    prompt format(MESSAGES['dealer_hand'], hand: dealer_hand)
  else
    dealer_hand = joinand(dealer, "#{dealer[-1][2]} #{dealer[-1][1]}")
    total = total(dealer)
    prompt format(MESSAGES['dealer_all'],
                  hand: dealer_hand, total: total)
  end
end

def compare_hands(player, dealer)
  dealer_hand = joinand(dealer, "#{dealer[-1][2]} #{dealer[-1][1]}")
  player_hand = joinand(player, "#{player[-1][2]} #{player[-1][1]}")
  d_total = total(dealer)
  p_total = total(player)

  prompt format(MESSAGES['hand_comparison'],
                dealer_hand: dealer_hand, d_total: d_total,
                player_hand: player_hand, p_total: p_total)
  blank_line
end

def display_scores(scores)
  scores = <<~SCORES
  => SCOREBOARD
  => ========================
  => Player: #{scores[:player]}     Dealer: #{scores[:dealer]}
  => ========================

  SCORES
  puts scores
end

def display_result(player, dealer)
  result = detect_result(player, dealer)

  case result
  when :player_busted
    prompt MESSAGES['player_bust']
  when :dealer_busted
    prompt MESSAGES['dealer_bust']
  when :player
    prompt MESSAGES['win']
  when :dealer
    prompt MESSAGES['lose']
  when :tie
    prompt MESSAGES['tie']
  end
end

def display_grand_result(scores)
  blank_line
  prompt scores[:player] == 5 ? MESSAGES['grand_win'] : MESSAGES['grand_lose']
  blank_line
end

# ----------- Calculating totals, scores, results ----------- #
def total(hand)
  values = hand.map { |card| card[0] }
  total = values.sum

  values.select { |v| v == 11 }.count.times do
    total -= 10 if total > GOAL
  end

  total
end

def busted?(total)
  total > GOAL
end

def detect_result(player, dealer)
  p_total = total(player)
  d_total = total(dealer)

  if p_total > GOAL
    :player_busted
  elsif d_total > GOAL
    :dealer_busted
  elsif p_total > d_total
    :player
  elsif d_total > p_total
    :dealer
  else
    :tie
  end
end

def update_scores(scores, result)
  if result == :dealer_busted || result == :player
    scores[:player] += 1
  elsif result == :player_busted || result == :dealer
    scores[:dealer] += 1
  end
  scores
end

def game_over?(scores)
  scores[:player] == WINNING_SCORE || scores[:dealer] == WINNING_SCORE
end

# ------------------------ GAME PLAY ------------------------ #

# deck = [[10, "Queen", HEARTS], [2, "2", SPADES]...]
def initialise_deck
  new_deck = []
  SUITS.each do |suit|
    13.times do |idx|
      card = [VALUES[idx], RANKS[idx], suit]
      new_deck << card
    end
  end

  new_deck.shuffle
end

# card = [numeric value, rank, suit]
def deal_card(deck)
  deck.pop
end

# hand = [card, card]
def initial_deal(deck)
  player = []
  dealer = []

  2.times do |_|
    card = deal_card(deck)
    player << card

    card = deal_card(deck)
    dealer << card
  end

  [player, dealer]
end

def both_stay(scores, player, dealer)
  show_hands(player, dealer)
  compare_hands(player, dealer)
  display_result(player, dealer)
  update_scores(scores, detect_result(player, dealer))
end

# ------------------------ Player Methods ------------------- #
def player_turn(scores, deck, player, dealer) # METHOD TOO COMPLEX
  show_hands(player, dealer)

  if total(player) == GOAL
    print MESSAGES['blackjack']
    gets
    return
  end

  player_choice(scores, deck, player, dealer)

  if busted?(total(player))
    :player_busted
  end
end

def player_choice(scores, deck, player, dealer)
  loop do
    choice = prompt_choice
    if choice == 'h'
      player_hit(scores, deck, player)
      show_hands(player, dealer)
      if total(player) == GOAL
        twentyone(scores, player, dealer)
        choice = 's'
      end
    end
    break if choice == 's' || busted?(total(player))
  end
end

def prompt_choice
  choice = ''
  loop do
    print MESSAGES['choice']
    choice = gets.chomp.downcase
    break if ['h', 's'].include?(choice)
    prompt MESSAGES['invalid_choice']
  end
  choice
end

def twentyone(scores, player, dealer)
  clear_screen
  display_scores(scores)
  show_hands(player, dealer)
  print MESSAGES['twentyone']
  gets
  blank_line
end

def player_hit(scores, deck, player)
  clear_screen
  display_scores(scores)
  player << deal_card(deck)
  prompt MESSAGES['hit']
  blank_line
end

def player_busted(scores, player, dealer)
  compare_hands(player, dealer)
  display_result(player, dealer)
  update_scores(scores, detect_result(player, dealer))
end

def player_stays(scores, player)
  clear_screen
  display_scores(scores)
  prompt format(MESSAGES['stay'], total: total(player))
  blank_line
end

# ------------------------ Dealer Methods ------------------- #
def dealer_turn(scores, deck, player, dealer)
  show_hands(player, dealer)

  loop do
    sleep(1.5)
    break if total(dealer) >= MINIMUM_HIT
    clear_screen
    display_scores(scores)
    dealer_hit(deck, dealer)
    show_hands(player, dealer)
    break if busted?(total(dealer))
  end

  if busted?(total(dealer))
    :dealer_busted
  end
end

def dealer_hit(deck, dealer)
  dealer << deal_card(deck)
  prompt MESSAGES['dealer_hit']
  blank_line
end

def dealer_busted(scores, player, dealer)
  compare_hands(player, dealer)
  display_result(player, dealer)
  update_scores(scores, detect_result(player, dealer))
end

def dealer_stays(scores, dealer)
  clear_screen
  display_scores(scores)
  prompt format(MESSAGES['dealer_stay'], total: total(dealer))
  blank_line
end

# ---------------------- A Round of 21 ---------------------- #
def play_round(scores)
  deck = initialise_deck
  player, dealer = initial_deal(deck)

  player_turn = player_turn(scores, deck, player, dealer)
  if player_turn == :player_busted
    scores = player_busted(scores, player, dealer)
    return scores
  end
  player_stays(scores, player)

  dealer_turn = dealer_turn(scores, deck, player, dealer)
  if dealer_turn == :dealer_busted
    scores = dealer_busted(scores, player, dealer)
    return scores
  end
  dealer_stays(scores, dealer)

  both_stay(scores, player, dealer)
end

# ------------------- A Game Until 5 Wins ------------------- #
def play_game
  scores = { player: 0, dealer: 0 }

  loop do
    wait
    clear_screen
    display_scores(scores)
    scores = play_round(scores)
    break if game_over?(scores)
  end

  display_grand_result(scores)
end

# ------------------------ MAIN GAME ------------------------ #
clear_screen
prompt MESSAGES['welcome']
prompt MESSAGES['separator']
prompt MESSAGES['how_to']

loop do
  play_game
  break unless play_again?
end

clear_screen
blank_line
prompt MESSAGES['bye']
blank_line
