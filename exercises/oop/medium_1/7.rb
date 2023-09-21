class GuessingGame

  attr_accessor :guess_number, :guess
  attr_reader :range

  def initialize(num_1, num_2)
    @range = (num_1..num_2)
    @guess_number = Math.log2(range.size).to_i + 1
  end

  def play
    system 'clear'
    @target = range.to_a.sample
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
    print "Enter a number between #{range.first} and #{range.last}: "
    self.guess = gets.chomp.to_i

    break if range.include? guess
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

game = GuessingGame.new(501, 1500)
game.play
