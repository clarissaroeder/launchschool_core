class GuessingGame
  MAX_GUESSES = 7

  attr_accessor :guess_number, :guess

  def initialize
    @guess_number = MAX_GUESSES
  end

  def play
    system 'clear'
    @target = (1..100).to_a.sample
    @guess = nil

    loop do
      display_guesses
      prompt_guess
      detect_result
      self.guess_number -= 1
      break if won? || guess_number == 0
    end

    if won?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def display_guesses
    puts "You have #{guess_number} guesses remaining."
  end

  def prompt_guess
    loop do
    print "Enter a number between 1 and 100: "
    self.guess = gets.chomp.to_i

    break if (1..100).include? guess
    print "Invalid guess. "
    end
  end

  def detect_result
    if guess > @target
      puts "Your guess is too high."
    elsif guess < @target
      puts "Your guess is too low."
    elsif won?
      puts "That's the number!"
    end

    puts
  end

  def won?
    guess == @target
  end

end

game = GuessingGame.new
game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end
