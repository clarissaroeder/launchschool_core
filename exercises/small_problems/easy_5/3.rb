# Problem: Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. 
# Input: String (24hour format)     Output: Integer (positive)
# Return value should range between 0..1439
# Should handle 24:00
# No usage of Date and Time classes

MINUTES_PER_HOUR = 60

def after_midnight(string)
  time = [(string.slice(0..1).to_i) % 24, string.slice(3..4).to_i]
  minutes = time[0] * MINUTES_PER_HOUR + time[1]
end

def before_midnight(string)
  time = [(string.slice(0..1).to_i) % 24, string.slice(3..4).to_i]
  minutes = (MINUTES_PER_HOUR - time[1]) + ((time[0] - 1) * MINUTES_PER_HOUR)
end


# Examples:
p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Algorithm:
  # 1. Convert string into hours and minutes variables with integers:
    # Hours: call to_i (converts up until non-numeric character)
    # Minutes: slice(2..4).to_i
    # Save in array and return
  # 2. Calculate deviation in minutes from 00:00
    # After midnight: just convert into minutes: hours * 60 + minutes
    # Before midnight: how many minutes lie in between input and 00:00?
      # How many minutes until the full hour? 60 - minutes
      # How many hours until midnight? hours - 1 (transfer from minutes) 
      # How many minutes are those hours? hours * 60
      # Add minutes and hour minutes together
