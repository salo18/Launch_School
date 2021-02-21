# As seen in the previous exercise, the time of day can be represented as the number
# of minutes before or after midnight. If the number of minutes is positive, the
# time is after midnight. If the number of minutes is negative, the time is before
# midnight.

# Write two methods that each take a time of day in 24 hour format, and return the
# number of minutes before and after midnight, respectively. Both methods should
# return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# def before_midnight(str)
#   hour = str[0,2]
#   minute = str[3,2]

#   minutes = (hour.to_i * 60) + minute.to_i
#   if minutes == 1440
#     return 0
#   elsif minutes == 0
#     return 0
#   else
#     minutes_final = 1440 - minutes
#   end
#   minutes_final
# end

# def after_midnight(str)
#   hour = str[0,2]
#   minute = str[3,2]

#   minutes = (hour.to_i * 60) + minute.to_i
#   if minutes == 1440
#     return 0
#   elsif minutes == 0
#     return 0
#   else
#     minutes_final = 0 + minutes
#   end
#   minutes_final
# end

# this solution worked!

# LS answer:
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)

end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0