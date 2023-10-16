class SumOfMultiples
  attr_reader :numbers

  def initialize(*numbers)
    @numbers = numbers.empty? ? [3, 5] : numbers
  end

  def to(max)
    (1...max).select do |num|
        multiple?(num)
    end.sum

  end

  def self.to(max)
    self.new.to(max)
  end

  private
  def multiple?(num)
    numbers.any? do |div|
      (num % div).zero?
    end
  end
end