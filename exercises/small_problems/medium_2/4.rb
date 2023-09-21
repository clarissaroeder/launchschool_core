=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, 
false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
Note that balanced pairs must each start with a (, not a ).

---------------
PROBLEM
---------------
Restate: Given a string, write a method that determines whether that string is 'properly balanced'. 
'Properly balanced' means that parentheses must occur in matching ( ) pairs. Balanced pairs start with an
open parentheses, not a closed one: (), not )(.

Input: String
Output: Boolean
Rules: Parentheses pairs must be balanced, i.e., for every open one must be a close one and vice versa. 
Pairs start with an open parenthesis.

EXAMPLE
---------------
'What is) this?' -> false because no open parenthesis 

'((What) (is this))?' 
( -> incomplete
( -> incomplete, incomplete
) -> incomplete, complete
( -> incomplete, complete, incomplete
) -> incomplete, complete, complete
) -> complete, complete, complete

'((What)) (is this))?'
( -> incomplete
( -> incomplete, incomplete
) -> inc, com
) -> com, com
( -> com, com, inc
) -> com, com, com
) -> no open incomplete --> invalid

DATA STRUCTURES
---------------
- Array of parentheses: extract all parentheses from the string to make checking for order easier?
- Array of complete/incomplete?
  - [(, ], [(), (, ]

---------------
NOTES:
To be balanced:
- Same number of open and closed parentheses present -> Number
  - If there is not the same number of parentheses, don't bother checking the order
- An open one must be followed by a closed one -> Order
- A closed one cannot precede an open one -> Order

- Some sort of switch variable? Complete pair vs incomplete?
- When encountering an open parenthesis: add an incomplete pair to some list (at the front)
- When encountering a closed parenthesis: see if there are any open incompletes:
  - If yes, complete one
  - If no, this parenthesis is invalid
- If there is an invalid closed parenthesis, or not all incompletes are turned complete, the pairs are not proper


ALGORITHM
---------------
- Count the number of open and closed parentheses
- If there is an equal number, check the order:
  - Define a order checking array
  - Iterate over the string:
    - For each open parenthesis, prepend an 'incomplete' element to the array
    - For each closed parenthesis, iterate through the array and find the first instance of 'incomplete', and switch it to 'complete'
      - If there is no 'incomplete' available, the closed parenthesis is invalid 
  - When finished iterating, and there has not been an invalid closed parenthesis, check for instances of 'incomplete'
    - If all pairs are completed, the pairs are properly balanced
=end

# def balanced?(string)
#   return false if string.count('(') != string.count(')')

#   pairs = []
#   string.each_char do |c|
#     if c == '('
#       pairs << 'incomplete'
#     elsif c == ')'
#       return false if !pairs.include?('incomplete')
#       pairs.each_with_index do |status, idx| 
#         if status == 'incomplete'
#           pairs[idx] = 'complete'
#           break
#         end
#       end
#     end
#   end

#   return true if pairs.all? { |status| status == 'complete' }
#   false
# end


=begin
- Add 1 for every open parenthesis
- Subtract 1 for every closed parenthesis
- If parentheses are balanced, the outcome should be 0
- If the sum is ever below 0, a closed parenthesis came before an open one

ALGORITHM:
- Define a counter variable and set to 0
- Iterate over the string:
  - Increment counter by 1 if there is an open parenthesis
  - Decrement counter by 1 if there is a closed parenthesis
  - Terminate the process if the counter every goes below 0
- Check if the counter is at 0 

=end

def balanced?(string)
  sum = 0

  string.each_char do |c|
   sum += 1 if c == '('
   sum -= 1 if c == ')'
   break if sum < 0
  end
  
  sum.zero?
end

# Examples:
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false