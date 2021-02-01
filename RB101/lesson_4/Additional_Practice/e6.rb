# Amend this array so that the names are all shortened to just the
# first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# flinstones.map do |name|
#   if name.size > 3

#   end

# end

# i was on the right track with map but couldn't figure it out... so wrote my
# own method

def name_3(arr)
counter = 0
new_arr = []
  loop do
    current_name = arr[counter]
    new_arr << current_name[0,3]
    counter += 1
    break if counter == arr.size
  end
  new_arr
end

# LS answer
flintstones.map! { |name| name[0,3] }
