class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1

    aliquot_sum = find_aliquot_sum(number)

    case 
    when aliquot_sum == number then 'perfect'
    when aliquot_sum > number then 'abundant'
    when aliquot_sum < number then 'deficient'
    end
  end

  class << self
    private

    def find_aliquot_sum(number)
      factors = []
      1.upto(number - 1) { |div| factors << div if number % div == 0 }
      factors.sum
    end
  end
end