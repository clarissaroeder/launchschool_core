class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    raise ArgumentError.new("Slice length too large.") if length > digits.length

    digits.chars.map(&:to_i).each_cons(length).to_a
  end
end
