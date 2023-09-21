=begin
In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

FURTHER EXPLORATION:
After a while, even this method starts to take too long to compute results. Can you provide a solution to this 
problem that will work no matter how big the number? You should be able to return results almost instantly. 
For example, the 123,456,789,987,745th Fibonacci number ends in 5.

  Repetitive pattern of last digit every 60 n: call n % 60

=end

def fibonacci_last(n)
  last = [1, 1]

  3.upto(n) do
    last = [last.last, (last.first + last.last) % 10]
  end

  last.last
end


# # Examples
# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4