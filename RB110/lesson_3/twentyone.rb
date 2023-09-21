# CONSTANTS
ONE = 1
ELEVEN = 11

# METHODS
def prompt(msg)
  puts "=> #{msg}"
end

# Formatting
def joinand(hand, last_value='?')
  values = hand.map { |card| card[1] }
  case values.size
  when 2
    values[-1] = " and #{last_value}"
    values.join
  else
    values[-1] = "and #{last_value}"
    values.join(', ')
  end
end

# Game play
def initialise_deck
  values = {}
  (2..10).each { |v| values[v.to_s] = v }
  %w(Jack Queen King).each { |v| values[v] = 10 }
  values['Ace'] = ELEVEN

  new_deck = {}
  %w(Heart Diamonds Clubs Spades).each { |suit| new_deck[suit] = values }

  new_deck
end

def initialise_hands(deck)
  player = []
  dealer = []

  2.times do |_|
    card = deal_card(deck)
    if card[1] == 'Ace'
      card = determine_ace_value(player, card)
    end
    player << card

    card = deal_card(deck)
    if card[1] == 'Ace'
      card = determine_ace_value(dealer, card)
    end
    dealer << card
  end

  [player, dealer]
end

def deal_card(deck)
  suit = deck.keys.sample
  card_value = deck[suit].keys.sample
  card = [deck[suit][card_value], card_value, suit]
  deck[suit].delete(card_value)
  card
end

def determine_ace_value(hand, card)
  if determine_total(hand) + ELEVEN > 21
    card[0] = ONE
  end
  card
end

def determine_total(hand)
  hand.map { |card| card[0] }.sum
end

def show_hands(player, dealer)
  prompt "Dealer has: #{joinand(dealer)}"
  prompt "You have:   #{joinand(player, player[-1][1])}, " \
         "for a total of #{determine_total(player)}."
  puts ''
end

def busted?(hand)
  determine_total(hand) > 21
end

# rubocop: disable Metrics/AbcSize, Metrics/MethodLength
def player_turn(player, deck)
  loop do
    choice = ''
    loop do
      print "=> Do you want to (h)it or (s)tay? "
      choice = gets.chomp.downcase
      break if ['h', 's'].include?(choice)
      prompt "Sorry, you must enter 'h' or 's'."
    end

    if choice == 'h'
      card = deal_card(deck)
      player << card

      puts ''
      prompt "You chose to hit!"
      prompt "Your cards are now #{joinand(player, player[-1][1])}, " \
             "for a total of #{determine_total(player)}."
      puts ''
    end

    break if choice == 's' || busted?(player)
  end
end
# rubocop: enable Metrics/AbcSize, Metrics/MethodLength

def dealer_turn(dealer, deck)
  prompt "Dealer's turn..."
  puts ''

  loop do
    break if determine_total(dealer) >= 17
    card = deal_card(deck)
    dealer << card

    prompt "Dealer hit!"
    prompt "Dealer's cards are now #{joinand(dealer, dealer[-1][1])}, " \
           "for a total of #{determine_total(dealer)}."
    puts ''
    break if busted?(dealer)
  end
end

def detect_result(player, dealer)
  player_total = determine_total(player)
  dealer_total = determine_total(dealer)

  if player_total > 21
    "You busted! Dealer wins"
  elsif dealer_total > 21
    "Dealer busted! You win!"
  elsif player_total > dealer_total
    "You win!"
  elsif dealer_total > player_total
    "Dealer wins!"
  else
    "It's a tie!"
  end
end

def display_result(player, dealer)
  prompt "======================"
  prompt "Dealer has #{joinand(dealer, dealer[-1][1])}, " \
         "for a total of #{determine_total(dealer)}."
  prompt "You have #{joinand(player, player[-1][1])}, " \
         "for a total of #{determine_total(player)}."
  prompt "======================"
  puts ''
  prompt detect_result(player, dealer)
end

def play_again?
  print "=> Do you want to play again? Press 'y' for yes: "
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# MAIN GAME
loop do
  system 'clear'
  prompt "Welcome to Twenty-One!"
  prompt "----------------------"
  puts ''

  deck = initialise_deck
  player_hand, dealer_hand = initialise_hands(deck)
  show_hands(player_hand, dealer_hand)

  player_turn(player_hand, deck, dealer_hand)
  if busted?(player_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    puts ''
    prompt "You chose to stay at #{determine_total(player_hand)}."
    puts ''
  end

  dealer_turn(dealer_hand, deck, player_hand)
  if busted?(dealer_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  end

  display_result(player_hand, dealer_hand)
  break unless play_again?
end

puts ''
prompt "Thank you for playing. Goodbye!"
