class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if invalid_octal?

    digits = octal.to_i.digits
    decimal = 0

    digits.each_with_index do |digit, exponent|
      decimal += digit * (8 ** exponent)
    end 

    decimal
  end

  private 

  def invalid_octal?
    octal.match? /[a-zA-Z89]/
  end
end