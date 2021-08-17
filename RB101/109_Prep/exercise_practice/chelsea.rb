# =begin
# 8/13/21
# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

# Problem:
# - need to "expand" an integer by breaking it up into its component parts
#  - integer ?? n (n is the size of the integer)
# Input: integer
# Output: a string representation of the expanded number

# Implicit / Explicit requirements:
# - 12 = 10 + 2
# - 42 = 40 + 2
# - 70304 = 70000 + 300 + 4
# - 11562 = 10000 + 1000 + 500 + 60 + 2
# > current integer plus (size minus current integer position) worth of 0's
# > every integer must be separated by a space and a `+` and a space
# > last integer doesn't have any 0's after

# DATA:


# Algorithm
# - `expanded_form` takes out the integers
# -- initialize a result array
# -- convert input integer into an array
# -- iterate over the array
#   - initialize current index = 0
#   - initialize array size == array.size
#   - x (array size - current index+1) number of times, append 0's to the number
#     -- skip this step if the integer is 0
#     >> figure out how to do the last integer ?
#   - store this number in new array
# >> this array will be passed in as argument to concatenate method
# - concatenate takes the array and outputs them in the desired format
#   - initialize an empty string
#   - iterate over the array
#     - add in "+ num "
#     - first integer should be added as "num "
#     - last integer should be added as "num"
# >> return the string
# =end


# def expanded_form(integer)
#   result = []

#   array_of_integers = integer.to_s.chars.reverse#.map {|i| i.to_i}


#   array_size = array_of_integers.size


#   array_of_integers.each_with_index do |num, idx|
#     int_str = num.to_s
#     (array_size - (idx + 1)).times do |n|
#       int_str << 0.to_s
#     end
#     result << int_str
#   end

#   final = result.delete_if do |str|
#     str[0] == "0"
#   end

#   concatenate(final)

# end


# def concatenate(array)

#   array.join(" + ")

# end


# p expanded_form(12) == '10 + 2'
# p expanded_form(42) == '40 + 2'
# p expanded_form(70304) == '70000 + 300 + 4'







=begin
Equal sides of an array
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array [1, 2, 3, 4, 3, 2, 1] : Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ( [1, 2, 3] ) and the sum of the right side of the index ([3, 2, 1] ) both equal 6.

Let's look at another one.
You are given the array [1, 100, 50, -51, 1, 1]: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ( [1] ) and the sum of the right side of the index ( [50,-51,1,1] ) both equal 1.

Last one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Problem:
- find the index for which the array elements to the left and right equal each other when added together
--- [1, 2, 3, 4, 3, 2, 1] >>>> returns index 3

Input: array of integers
Output: array index (an integer)
Implicit / Explicit requirements:
- array elements to the left (index 0..current) equals array elements to the right (current..array.size-1)
>>> what is the array index where this occurs?
- return -1 if there is no such index
# - Empty arrays are equal to 0 in this problem

Algorithm
- initialize `current_index` = 0
- iterate through the array
  - using element reference, array[0..current].sum == array[current..size]
  >> return current if that is true
  - if false continue iterating
- if the loop breaks, return -1
=end

# def left_equals_right(array)
#   current_index = 0

#   # array.select do |int|
#   #   array[0..(array.index(int) - 1)].sum == array[(array.index(int) - 1)..array.size].sum
#   # end

#   loop do
#     return current_index if array[0..(current_index-1)].sum == array[(current_index + 1)..(array.size)].sum
#     current_index += 1
#     break if current_index == array.size
#   end

#   return -1

# end


p left_equals_right([1, 2, 3, 4, 3, 2, 1]) #== 3
# p left_equals_right([1, 100, 50, -51, 1, 1]) == 1
# p left_equals_right([100, 50, -51, 1, 1]) == -1
#p left_equals_right([20, 10, -80, 10, 10, 15, 35]) == 0


