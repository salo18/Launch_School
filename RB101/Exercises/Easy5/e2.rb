# The time of day can be represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight. If the number of
# minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the
# time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# input: positive integer, negative integer or zero
# output: time of day in hh:mm format

# if the number is negative, the clock goes backwards
# neutral position is midnight at 00:00
# every hour is 60 minutes
# 80 minutes >> 1:20

# need two methods
# method 1 - convert int to hours using / 60 and %
# assign the hour and the remainder to two variables
# hour = int / 60
# minute = the remainder of int / 60
# if int is positive, add / if int is negative subtract
# if hour is greater tha 24, need to reset and continue counting

# method 2 - convert the hour and minute into string format 00:00


def time_of_day(int)
  hour = int / 60
  minute = int.remainder(60)

  puts "#{hour}:#{minute}"
end

# could not figure this out...
# LS answer:

MPH = 60
HPD = 24
MPD = 24 * 60

def time_of_day(minutes)
  minutes = minutes % MPD
  hours, mins = minutes.divmod(60)
  format('%02d:%02d', hours, mins)
end



time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"