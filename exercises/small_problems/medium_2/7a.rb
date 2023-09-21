=begin
An interesting variation on this problem is to count the number of months that have five Fridays. 
This one is harder than it sounds since you must account for leap years.

ALGORITHM:
- Define a months-with-five-fridays counter
- Define a friday-counter
- Start at first day of the year and find the first friday
  - Increment counter by 1
  - Skip to next week 
  - If the month is still the same, increment friday counter by 1
  - If it is the next month:
    - Check the friday counter: 
      - If it is 5, add 1 to the month counter and reset
      - If not, reset
  - Repeat until end of year

=end

require 'date'

def five_fridays(year)
  months = 0
  
  1.upto(12) do |m|
    fridays = 0
    date = Date.civil(year, m, 1)
  
    date.upto(date.next_month.prev_day) { |d| fridays += 1 if d.wday == 5 }
    p fridays
    months += 1 if fridays == 5

  end
    
  months
end

# Examples:
p five_fridays(1853) #== 1
# p five_fridays(1968) #== 4
# p five_fridays(1984) #== 2
# p five_fridays(2019) #== 1
# p five_fridays(2023) #== 4

