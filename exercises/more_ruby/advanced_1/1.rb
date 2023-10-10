factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

7.times { |number| puts "#{number}! == #{factorial.next}"}
7.times { |number| puts "#{number}! == #{factorial.next}"}

factorial.rewind
