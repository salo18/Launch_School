
=begin
You are given an array of integers. Your job is to take that array and find an index N where the
sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there
is no index that would make this happen, return -1. Empty arrays are equal to 0 in this problem.

Problem:
- need to find the index where the integers to the left and right add up to the same number
Input: an array of integers
Output: an integer that represent the index where the #s to the left and right equal the same number

Implicit / Explicit requirements:
- if there is no index to satisfy condition, return -1
- if the index where this occurs is the first index (index 0), return 0
  - in this case, numbers to the right equal 0
- current index should not be included in the addition... needs to be indexes to the left and right of it
- array is empty, return 0 (will this be covered or need to add separately?)

Algorithm
- need to iterate through the array and compare the sum of indexes to the left and right
  - [1, 2, 3, 4, 3, 2, 1]
  # index 0
    # 0 == [2, 3, 4, 3, 2, 1].sum
    arr[0...0]
  # index 1
  # [1].sum == [3, 4, 3, 2, 1].sum
    arr[1..-1]
- if condition returns true, return the index
=end

# def find_even_index(arr)
#   inner = 0
#   outter = 0

#   return 0 if arr.empty?
#   loop do
#     return outter if arr[inner...outter].sum == arr[outter+1..-1].sum
#     outter += 1
#     break if outter == arr.size
#   end

#   return -1


#   # p arr[inner...outter]
#   # p arr[outter+1..-1]
# end

# p find_even_index([]) == 0
# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p find_even_index([1, 100, 50, -51, 1, 1]) == 1
# p find_even_index([1, 2, 3, 4, 5, 6]) == -1
# p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3


# ADDITIONAL PROBLEMS:
# Problem 1: Substring at index
=begin
Write a method that will return a substring based on specified indices.

Problem:
- need to return a substring based on a specific start and end index
Input: a string, start index, end index
Output: the substring at that index
Implicit / Explicit requirements:

Algorithm
=end
# def substring(str, start, ending=start)
#   str[start..ending]
# end

# p substring("honey", 0, 2) == "hon"
# p substring("honey", 1, 2) == "on"
# p substring("honey", 3, 9) == "ey"
# p substring("honey", 2) == "n"

# Problem 2: All Substrings
# Write a method that finds all substrings in a string, no 1 letter words.
# def substrings(str)
#   arr = str.chars
#   result = []
#   index = 0
#   loop do
#     (index..arr.size-1).each do |idx|
#       result << arr[index..idx]
#     end
#     index += 1
#     break if index == arr.size
#   end
#   result.map {|sub| sub.join }.select {|sub| sub.size > 1}
# end

# p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
# p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
# p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']

# Problem 3: Palindromes
# Write a method that will return all palindromes within a string.
# def palindromes(str)
#   arr = str.chars
#   result = []
#   index = 0
#   loop do
#     (index..arr.size-1).each do |idx|
#       result << arr[index..idx]
#     end
#     index += 1
#     break if index == arr.size
#   end
#   result.map {|sub| sub.join }.select {|sub| sub == sub.reverse && sub.size > 1}
# end
# p palindromes('ppop') == ['pp', 'pop']

# Write a method that finds the longest substring that is a palindrome within a string.
# def longest_palindrome(str)
#   arr = str.chars
#   result = []
#   index = 0
#   loop do
#     (index..arr.size-1).each do |idx|
#       result << arr[index..idx]
#     end
#     index += 1
#     break if index == arr.size
#   end
#   result.map {|sub| sub.join }.select {|sub| sub == sub.reverse && sub.size > 1}.max_by{|sub| sub.size}
# end
# p longest_palindrome("ppop") == 'pop'

# Problem 4: Capitalize words
# Write a method that takes a single String argument and returns a new string that contains the original
# value of the argument with the first character of every word capitalized and all other letters
# lowercase. You may assume that words are any sequence of non-blank characters.
# def word_cap(str)
#   # str.split#.map{|word| word.capitalize!}.join(' ')
#   alph = ("a".."z").to_a + ("A".."Z").to_a
#   arr = str.split
#   arr.each do |word|
#     word.capitalize! if alph.include?(word[0])
#   end.join(" ")
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Problem 5: Interweaving Arrays
=begin
Write a method that combines two Arrays passed in as arguments and returns a new Array that
contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty and that they have the same number of elements.
# =end
# def interleave(arr1, arr2)
#   result = []
#   index = 0
#   loop do
#     result << arr1[index]
#     result << arr2[index]
#     index += 1
#     break if index == arr1.size
#   end
#   result
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, "a", 2, "b", 3, "c"]

# Problem 6: Sum same consecutive integers
=begin
You are given an array that contains only integers (positive and negative). Your job is to sum only
the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.

Problem:
- need to add up consecutive integers and put them into a new array in the same order
Input: an array of integers
Output: a new array containg like integers added up
Implicit / Explicit requirements:
- consecutive numbers need to be added up
- number can appear at different points in the array
- 0 needs to be included

Algorithm
- make substring style array containing like numbers but only if occur consecutively
[1,4,4,4,0,4,3,3,1,1] becomes [[1], [4, 4, 4], [0], [4], [3, 3], [1, 1]]
  - if num is the same at index + ?
  - 4.. is index 1 4? yes
    - is index 2 4? yes
    - is index 3 4? yes?
    - is index 4 4? no? stop
  RULE:
    - the same number appearing in a consecutive order X number of times
  - if index != index + 1
    subarray << [arr[index]]
- map > sum those subarrays
=end


# [1,4,4,4,0,4,3,3,1,1] becomes [[1], [4, 4, 4], [0], [4], [3, 3], [1, 1]]
# def sum_consecutives(arr)
#   subarrays = []
#   outter_index = 0
#   inner_index = 0
#   loop do
#     if arr[inner_index] != arr[inner_index + 1]
#       subarrays << [arr[inner_index]]
#       inner_index += 1
#       outter_index = inner_index
#     else
#       outter_index += 1 until arr[inner_index] != arr[outter_index]
#       subarrays << arr[inner_index...outter_index]
#     end
#     inner_index = outter_index
#     break if subarrays.flatten.size == arr.size
#   end

#   subarrays.map(&:sum)
# end

# #

=begin
You are given an array that contains only integers (positive and negative). Your job is to sum only
the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.
Problem:
- need to sum the array but only by consecutive numbers that are the same
Input: - an array of integers
Output: - an array of summed integers
Implicit / Explicit requirements:
- consecutive integers that are the same get added together
- if not, skip

Algorithm
- create an array with all the same integers in their own subarrays
  - index matters so must be in the same order as the array
- add up all the subarrays and return a new array

[1,4,4,4,0,4,3,3,1,1] == [[1], [4,4,4], [0], [3,3], [1,1]]
=end

def sum_consecutives(arr)
  result = []

  inner_index = 0
  outter_index = 0

  loop do
    if arr[inner_index] != arr[inner_index + 1]
      result << [arr[inner_index]]
      inner_index += 1
    else
      outter_index = inner_index
      outter_index += 1 until arr[inner_index] != arr[outter_index]
      result << arr[inner_index...outter_index]
      inner_index = outter_index
    end
    break if result.flatten.size == arr.size
  end
  result.map(&:sum)#.map {|sub| sub.sum}
end



p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

