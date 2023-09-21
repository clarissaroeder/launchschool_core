# Problem: write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a 
# String that represents that angle in degrees, minutes and seconds. A degree has 60 minutes, while a minute has 60 seconds.
# Input: floating point number          Output: string

DEGREE = "\xC2\xB0"

def dms(num)
  if num > 360
    num -= 360
  elsif num < 0
    num += 360 until num >= 0
  end

  total_seconds = num * 60 * 60
  degrees, remaining_seconds = total_seconds.divmod(60 * 60)
  minutes, seconds = remaining_seconds.divmod(60)
  format(%(#{degrees}#{DEGREE}%02d'%02d), minutes, seconds)
end

# Examples:
# p dms(30) #== %(30°00'00")
# p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773) #== %(93°02'05")
# p dms(0) #== %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) #== %(40°00'00")
p dms(-40) #== %(320°00'00")
p dms(-420) #== %(300°00'00")

