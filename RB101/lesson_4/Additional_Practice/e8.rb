# # What happens when we modify an array while we are iterating over it?
# # if the method is destructive, then the modified array will be output and they will
# # modify the array in real time

# # What would be output by this code?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# # the output of the code will be 1234
# # the code will return [2,3,4]

# # What would be output by this code?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
# # the output will be 1 2 3
# # the code will return [1,2,3]

# # WRONG...
# # found help here - https://launchschool.com/posts/9599229b

# numbers = [1, 2, 3, 4]
# index = 0
# while index < numbers.size
#   p numbers[index]
#   index += 1
# end

# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

require 'pry'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end


