def time_of_day(bool)
  if bool
    puts "it's daytime!"
  else
    puts "its nighttime!"
  end
end

daylight = [true, false].sample


time_of_day(daylight)