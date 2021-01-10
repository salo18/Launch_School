# Build a program that asks a user for the length and width of a room in meters and
# then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i

puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

puts "The area of the room is #{length*width} square meters (#{length*width*10.7639} square feet)."
