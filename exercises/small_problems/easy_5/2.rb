# Problem: Write a method that takes a time in minute based format and returns the time of day in 24 hour format (hh:mm).
# Input: Integer    Output: String in 24h format
# Explicit:
  # Minute-based format: 
    # If number of minutes is positive, the time is after midnight, and the minutes should be added to 00:00
    # If number of minutes is negative, the time is before midnight, and the minutes should be subtracted from 00:00
  # You may not use Date and Time classes
  # Any integer input should work, no need to deal with other input (?)
  # Disregard any complications like daylight savings, standard time etc.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(num)
  hours, minutes = num.divmod(MINUTES_PER_HOUR)
  hours = hours % HOURS_PER_DAY # Problem 1: one line normalising

  format('%02d:%02d', hours, minutes)
end


# Problem 2: using Date and Time class
SECONDS_PER_MINUTE = 60
def time_of_day(minutes)
  (Time.new(0) + minutes * SECONDS_PER_MINUTE).strftime("%R")
end

# Problem 3: with day of the week (start point 00:00am Sunday)
def time_of_day(minutes)
  (Time.new(2023,6,4,0,0,0) + minutes * SECONDS_PER_MINUTE).strftime("%A %R")
end


# Examples:
p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"

# Data Structures: Hours array

# Algorithm:
# 1. Turn input number into numbers of hours and numbers of minutes:
  # #divmod: save quotient as hours and modulo as minutes
  # Minutes are correct integer value!
# 2. Determine hours: use value as index in the hours array
# 3. Handle values larger than 1439 (one day has 1440 minutes), i.e., handle h values larger than 23
  # If h is larger than 24, reassign h to h % 24
# 4. Return the values at the relevant indices 
