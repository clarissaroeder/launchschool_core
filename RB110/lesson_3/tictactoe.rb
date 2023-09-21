require "pry"

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_user!(brd)
  square = 0
  loop do
    print "=> Choose a square #{empty_squares(brd).join(', ')}: "
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, this is not a valid square."
    end
  end
  brd[square] = PLAYER_MARKER
end

def place_computer!(brd)
  square = 0
  loop do
    square = rand(1..9)
    break unless brd[square] != INITIAL_MARKER
  end
  brd[square] = COMPUTER_MARKER
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if line.all? { |square| brd[square] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |square| brd[square] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

# MAIN GAME: START
prompt "Welcome to TIC TAC TOE!"
loop do
  board = initialise_board

  loop do
    display_board(board)

    place_user!(board)
    break if someone_won?(board) || board_full?(board)

    place_computer!(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
    puts ''
  end

  print "=> Do you want to play again (press 'Y/y' for yes)? "
  answer = gets.chomp
  break unless answer == 'Y' || answer == 'y'
end

prompt "Thanks for playing! Goodbye."
