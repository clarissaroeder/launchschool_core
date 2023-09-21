require 'yaml'

MESSAGES = YAML.load_file('rps_messages.yml')

# CONSTANTS
VALID_CHOICES = %w(rock paper scissors lizard spock)

ABBREVIATIONS = %w(r p s l v)

WINNING_CONDITIONS = { 'scissors' => ['paper', 'lizard'],
                       'paper' => ['rock', 'spock'],
                       'rock' => ['lizard', 'scissors'],
                       'lizard' => ['spock', 'paper'],
                       'spock' => ['scissors', 'rock'] }

# METHODS
def prompt_play_again?
  prompt(MESSAGES['again'])
  print("=> ")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def win?(first, second)
  losers = WINNING_CONDITIONS[first]
  losers.include?(second)
end

def convert_choice(choice)
  if choice.length == 1
    idx = ABBREVIATIONS.index(choice)
    choice = VALID_CHOICES[idx]
  end
  choice
end

def determine_round_result(player, computer)
  if win?(player, computer)
    MESSAGES['won']
  elsif win?(computer, player)
    MESSAGES['lost']
  else
    MESSAGES['tie']
  end
end

def display_result_match(scores)
  if scores[:player] == 3
    prompt(MESSAGES['congrats'])
  else
    prompt(MESSAGES['sorry'])
    prompt(MESSAGES['div'])
  end
  puts ''
end

def display_result_round(result, player, computer)
  prompt(format(
           MESSAGES['result_round'],
           player: player, computer: computer,
           result: result
         ))
end

def display_scores(scores)
  scores = <<~SCORES

  => SCOREBOARD
     You: #{scores[:player]}   Computer: #{scores[:computer]}

  SCORES
  puts scores
end

def get_choice
  choice = ''
  loop do
    print("=> ")
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice) || ABBREVIATIONS.include?(choice)
      break
    else
      prompt(MESSAGES['invalid_choice'])
    end
  end
  choice = convert_choice(choice)
end

def play_rounds(scores)
  loop do
    choice = get_choice
    computer_choice = VALID_CHOICES.sample
    system 'clear'

    result = determine_round_result(choice, computer_choice)
    scores = update_scores(scores, result)
    display_result_round(result, choice, computer_choice)
    display_scores(scores)

    if scores[:player] == 3 || scores[:computer] == 3
      break
    else
      prompt(MESSAGES['keep_playing'])
    end
  end
end

def prompt(message)
  puts("=> #{message}")
end

def update_scores(scores, result)
  if result == MESSAGES['won']
    scores[:player] += 1
  elsif result == MESSAGES['lost']
    scores[:computer] += 1
  end
  scores
end

# GAME START
system 'clear'
prompt(MESSAGES['welcome'])

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt(MESSAGES['how_to_play'])

  scores = { player: 0, computer: 0 }
  display_scores(scores)

  play_rounds(scores)

  display_result_match(scores)

  break unless prompt_play_again?
end

puts ''
prompt(MESSAGES['bye'])
