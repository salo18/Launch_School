# What will the following code print, and why? Don't run the code until you have
# tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# array2 is given the array elements in array1 ono line 6 using the shovel method
# line 7 mutates the caller for those values and capitalizes words starting with C and S
# array2 SHOULD also have those words capitalized because it is still pointing to the
# values in array1. Just not sure if the pass by reference applies across arrays but
# my gut tells me that it does

