
# 1

# def repeat(str, num)
#   num.times do |word|
#     puts str
#   end
# end

# repeat('Hello', 3)

# 2

# def is_odd?(num)
#   num.abs % 2 != 0
# end


# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# 3

# def digit_list(num)
#   num.to_s.chars.map do |n|
#     n.to_i
#   end
# end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# 4

=begin
# Problem:
- need to convert an array into a hash
- hash key is the array element
- hash value is the number of times the key is inside the array

# Algo:
- iterate through the array and assign each array element as a hash key
- figure out how many times the element exists in the array and assign this as
the hash value
- print out the hash key value pairs
=end

# vehicles = [
#   'car', 'car', 'truck', 'Car', 'SUV', 'truck',
#   'Motorcycle', 'motorcycle', 'car', 'truck'
# ]

# def count_occurrences(arr)
#   hash = {}

#   arr.each do |el|
#     hash[el.downcase] = arr.count(el)
#   end


#   hash.each do |k, v|
#     p "#{k} => #{v}"
#   end

# end
# p count_occurrences(vehicles)
# # car => 4
# # truck => 3
# # SUV => 1
# # motorcycle => 2

# 5
=begin
Write a method that takes one argument, a string, and returns a new string
with the words in reverse order.

Problem:
- need to reverse the order of the words

Input: a string
Output: a new string - words in reverse order
Implicit / Explicit requirements:
- empty string returns an empty string
- string full of spaces returns an empty string

Algorithm
- convert the string into an array
- initialize a new array
- iterate over the original string and put words into the new array by counting
down the index
-
=end

# def reverse_sentence(str)
#   # arr = str.split
#   # result = []

#   # index = arr.size - 1
#   # until index == -1
#   #   result << arr[index]
#   #   index -= 1
#   # end
#   # result.join(" ")

#   str.split.reverse.join(" ")
# end

# p reverse_sentence('Hello World') == 'World Hello'
# p reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# 6

# def reverse_words(str)
#   arr = str.split

#   arr.map! do |word|
#     if word.size > 5
#       word.reverse
#     else
#       word
#     end
#   end
#   arr.join(" ")
# end
# p reverse_words('Professional')          # => lanoisseforP
# p reverse_words('Walk around the block') # => Walk dnuora the kcolb
# p reverse_words('Launch School')         # => hcnuaL loohcS

# 7

=begin
Write a method that takes one argument, a positive integer, and returns a
string of alternating 1s and 0s, always starting with 1. The length of the
string should match the given integer.

Problem:

Input: an integer
Output: a string with a pattern of 1 and 0 the length of the integer

Implicit / Explicit requirements:
- output must start with 1


Questions?
What should the return value be? A new object or mutate the argument?
What happens if the input is an empty string/hash/array?

Examples/Test Cases?

Data Structure

Algorithm
- iterate over number (1 up to number)
- intiailize a new string
- as you iterate, put 1 or 0 into the string
  - determine which to put based on number being even or odd
=end

# def stringy(num, start = 0)
#   result = ""
#   1.upto(num) do |n|
#     if start == 0
#       if n.odd?
#         result << "#{start + 1}"
#       else
#         result << "#{start}"
#       end
#     elsif
#       if n.odd?
#         result << "#{start + 1}"
#       else
#         result << "#{start}"
#       end
#     end
#   end
#   result
# end

# puts stringy(6, 1) #== '101010'
# puts stringy(9, 7) #== '101010101'
# puts stringy(4) #== '1010'
# puts stringy(7) #== '1010101'

# 8
=begin
Write a method that takes one argument, an array containing integers, and
returns the average of all numbers in the array.

Problem:
- need to add up all the numbers in the array and divide by the size of the array
Input: an array of integers
Output: an integer that represents the average of the integers in the array

Algorithm
- add up all the array elements
- divide by the size of the array
- return this value

=end

# def average(arr)
#   arr.sum.to_f / arr.size
# end

# puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) #== 25
# puts average([9, 47, 23, 95, 16, 52]) #== 40

# 9
=begin
Write a method that takes one argument, a positive integer, and returns
the sum of its digits.

Problem:
- need to sum up the digits inside an integer

Input: an integer
Output: an integer - all the integers summed up together

Algorithm
- initialize an empty array
- add each integer to the array as its own array element
- sum the array - this is the return value
=end

# def sum(num)
#   arr = num.to_s.chars

#   arr.map! do |m|
#     m.to_i
#   end

#   arr.sum
# end

# puts sum(23) #== 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# 10
=begin
# Write a method that takes two arguments, a positive integer and a boolean,
and calculates the bonus for a given salary. If the boolean is true, the bonus should
be half of the salary. If the boolean is false, the bonus should be 0.

Problem:
Input: an integer and boolean
Output: an integer -- half the integer if true, 0 if false

Algorithm
- if conditional...
-- if boolean is true, half the salary
-- if false, 0
=end

# def calculate_bonus(salary, bool)
#   # if bool
#   #   salary / 2
#   # else
#   #   0
#   # end

#   bool ? salary / 2 : 0

# end

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000