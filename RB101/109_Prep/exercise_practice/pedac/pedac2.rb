# https://launchschool.com/gists/c013accd


# Reverse Odd Words:
# input: whats the matter with kansas.
# output: whats eht matter htiw kansas.

# Problem:
# - need to reverse every other word
# - last word must still have a period at the end

# Questions?
# What should the return value be? A new object or mutate the argument?
# - return value should be a new object
# -

# Implicit / Explicit requirements:

# Input: a string
# Output: a new string with every other word reversed

# Examples/Test Cases?
# reverse("whats the matter with kansas.") == "whats eht matter htiw kansas."
# reverse("hi bobby.") == "hi ybbob."
# reverse("Pineapple Hawaii Joe.") == "Pineapple iiawaH Joe."

# Data Structure - array

# Algorithm
# - initialize a new array
# - convert the string into an array with each word as its own array element
# - determine the index of each word
#   - if the word's index is even, do nothing
#   - if the word's index is odd, reverse it
# - how to deal with a string that contains an even number of words?
# what to do with the period at the end of the last word?
#   - MAKE HELPER METHOD -- if the array size is even
#     - grab the last element of the array
#     - need to make sure the period is at the end of the word
#     - initialize a new variable to hold the a new string
#     - iterate through the last word in the array
#       - delete the period that is the first character and add a new one at the end
#     - return the updated array

# Code

# def reverse(str)
#   array = str.split

#   array.each_with_index do |word, idx|
#
#     word.strip!
#     word.reverse! if idx.odd?
#   end

#   if array.size.even?
#     period(array)
#   end
#   array.join(" ")
# end

# def period(arr)
#   arr.last.delete!(".")
#   arr.last << "."
#   arr.join(' ')
# end

=begin
Algorithm:
- split string into an array of strings
- intitialize a new array
- put old array into new array and reverse the string if odd index
- join the array into a new string
- delete any periods in the string
- append a new string at the end
=end

# def reverse(str)
#   result = []
#   str.split.each_with_index do |word, idx|
#     if idx.even?
#       result << word
#     elsif idx.odd?
#       result << word.reverse
#     end
#   end

#   p result.join(" ").delete(".").strip << "."

# end

# p reverse("whats the matter with kansas.") == "whats eht matter htiw kansas."
# p reverse("hi bobby.") == "hi ybbob."
# p reverse("hi bobby hi bobby.") == "hi ybbob hi ybbob."
# p reverse("Pineapple Hawaii Joe.") == "Pineapple iiawaH Joe."


# p reverse("hello.") == "hello."
# p reverse("hello .") == "hello."
# p reverse("hello world.") == "hello dlrow."
# p reverse("hello world .") == "hello dlrow."
# p reverse("hello world . ") == "hello dlrow."
# p reverse("hello  world  . ") == "hello dlrow."
# p reverse("hello  hello world.") == "hello olleh world."


# NEW PROBLEM:
=begin
Write a function that takes an integer number as an input and prints out a diamond with the "*"
character whose width is the number `n`.

Problem:
- argument integer represents the length of the longest and middle row
- each character in the row is either a space or a *
- rows can only contain odd numbers... if integer is even return an error?
- middle row == n
-- number of rows == n - 2 until n == 1
----- if n == 7, there are rows with length of 5, 3 and 1
- rows are mirrored before and after longest row meaning that there is a top and bottom half to the diamond
-

Questions?
What should the return value be? A new object or mutate the argument?
- new object
What happens if the input is an empty string/hash/array?
- return an empty string
What about even numbers?

Implicit / Explicit requirements:
- integer `n` represents the middle and longest row of the diamond
- `n` must be an odd number otherwise return an error
- there are `n` - 2 number of rows until `n` == 1
--- rows must be reflected on the top and bottom of the longest row
- longest row is composed of only *
-- other rows have `n` - 2 number of * and the rest is spaces
--- spaces must be on the outside of the * (* must concentrate in the middle of the row)

Input: an integer
Output: a star consisting of ' ' and '*'

Examples/Test Cases?
Given n = 3
 *
***
 *

Given n = 5
  *    # space space star space space
 ***   # space star star star space
*****  # star star star star star
 ***   # space star star star space
  *    # space space star space space

Data Structure
- an array or nested array?

Algorithm
- initialize a variable that points to either a string or a *
- determine the number or rows that are in the diamond... n - 2 until n == 1
- create a string or array representing each row
- populate each row with spaces or stars as necessary
-- longest row has all stars
-- second longest rows have stars - 2 spaces
-- continue doing that until there is only one star in the row
- output the diamod in the correct order -- smallest row to largest row to smallest row

Algorithm for populate_diamond()
- input:
-- the number of rows (and stars)
-- a nested array containing x number of sub arrays
- output:
-- a nested array containing the rows of the diamond, each row represented as its own subarray

- need to use the row number to calculate how many spaces and stars should go in each sub array
and the order they are placed in the sub array

-
=end

# def stars(longest_row)
#   puts "please enter an odd integer" if longest_row.even?

#   diamond = []

#   longest_row.times do |_|
#     diamond << []
#   end

#   populate_diamond(longest_row, diamond)
#   # ==> diamond = [[' ', ' * ', ' '], ['*', '*', '*'], [' ', ' * ', ' ']]

#   diamond.each do |star|
#     puts star.join
#   end
#   p diamond
# end

# def populate_diamond(row_number, diamond)

#   index = 0
#   row = 1
#   if row == 1
#     lspace = 1
#     rspace = 1
#   else
#     lspace = row - 2
#     rspace = row - 2
#   end

#   loop do
#     lspace.times { |_| diamond[index] << " "}
#     row.times { |_| diamond[index] << "*"}
#     rspace.times { |_| diamond[index] << " "}
#     index += 1
#     row += 2
#     break if index + 1 == row_number
#   end

#   diamond
#   # loop do
#   #   # create a new sub array within diamond -- helper method?
#   #   longest_row.times do |i|
#   #     bspace.times {|i| diamond[i] << " "}
#   #     row.times {|i| diamond[i] << "*"}
#   #     espace.times {|i| diamond[i] << " "}
#   #   end
#   #   break
#   # end
# end

# stars(1)
# stars(3)
# stars(5)
# stars(6)



# CENTURY:
=begin
  Write a function that takes an integer year as input and returns the century. The return value should be
  a string that begins with the century number and ends with st, nd rd or th as appropriate for that number.
  New centuries begin in years that end with 01. So the years 1901 - 2000 comprise the 20th century

Problem:
- need to convert a data into a century

Questions?
What should the return value be? A new object or mutate the argument?
- new object
What happens if the input is an empty string/hash/array?
- return an empty string
What if the input is 0?
- say "please type a number greater than 0"

Implicit / Explicit requirements:
- centuries that end in 1 need to end in `st` (1st, 21st, etc)
- centuries that end in 2 need to end in `nd` (2nd, 42nd, etc)
- centuries that end in 3 need to end in `rd` (3rd, 53rd, etc)
- centuries that end in 4-9 or 0 need to end in `th` (4th, 79th, 88th, 300th)
- new century begins on the first year of the century
-- (1901 - 2000) is the 20th century
-- if the year ends in 0, it is in the previous century
- number can't be negative
- number can't be 0

Input: an integer that represents a year
Output: the century that year belongs to

Examples/Test Cases?
century(0) == "please type a number greater than 0"
century(1900) == "18th century"
century(1) == "1st century"
century(22002) = "221st century"
century(500001) = "5001st century"

Data Structure
- string manipulation?

Algorithm
- extract the beginning digits of the number -- up to the last two digits
--- this number + 1 is the century number
WRONG^^^^^ fix this
- extract the last digit of the number -- this number determines the
string it ends with (st, nd, rd, th)
- if the number ends in 0, it is in the first x digits (miinus 2) century - 1

=end

# def century(num)

#   result = ""

#   if num.to_s[-1].to_i == 0
#     result << (num).to_s[0...-2]
#   else
#     result << (num.to_s[0...-2].to_i + 1).to_s
#   end


#   if result[-2..-1].to_i == 11 || result[-2..-1].to_i == 12 || result[-2..-1].to_i == 13
#       result << "th"
#   elsif result[-1].to_i == 1
#       result << "st"
#     elsif result[-1].to_i == 2
#       result << "nd"
#     elsif result[-1].to_i == 3
#       result << "rd"
#     else
#       result << "th"
#   end

#   if result == "th"
#       "please type a number greater than 0"
#     else
#       "#{result} century"
#   end

# end

# p century(11211)
# p century(22521)
# p century(0) == "please type a number greater than 0"
# p century(1900) == "18th century"
# p century(1965) == "20th century"
# p century(765) == "8th century"
# p century(1) == "1st century"
# p century(22002) == "221st century"
# p century(500001) == "5001st century"


# SCRABBLE:
=begin
Write a program that, given a word, computes the scrabble score for that word.

A, E, I, O, U, L, N, R, S, T    == 1
D, G                            == 2
B, C, M, P                      == 3
F, H, V, W, Y                   == 4
K                               == 5
J, X                            == 8
Q, Z                            == 10


Problem:
- need to convert a string into a score
- each letter in the string has a point value
- need to add up all the point values and output the word's score

Questions?
What should the return value be? A new object or mutate the argument?
- new integer object should be returned
What happens if the input is an empty string/hash/array?
- return 0

Implicit / Explicit requirements:
- word must be in all capitals -- convert lower case to caps
- an empty string returns 0 points
- be any string of letters in the alphabet

Input: a string (each letter has a point value)
Output: an integer (the sum of all the points of the word)

Examples/Test Cases?

Data Structure
- array

Algorithm
- iterate through the letters in the string
- initialize a new array and put the corresponding point value into the array
- sum the array and return this value

=end

# def scrabble(str)
#   result = []

#   str.upcase.chars.each do |letter|
#     if letter == "A" || letter == "E" || letter == "I" || letter == "O" || letter == "U" || letter == "L" ||
#       letter == "N" || letter == "R" || letter == "S" || letter == "T"
#       result << 1
#     elsif letter == "D" || letter == "G"
#       result << 2
#     elsif letter == "B" || letter == "C" || letter == "M" || letter == "P"
#       result << 3
#     elsif letter == "F" || letter == "H" || letter == "V" || letter == "W" ||
#       letter == "Y"
#       result << 4
#     elsif letter == "K"
#       result << 5
#     elsif letter == "J" || letter == "X"
#       result << 8
#     elsif letter == "Q" || letter == "Z"
#       result << 10
#     end
#   end
#   result.sum
# end


# redo with hash

# def scrabble(str)
#   table = {
#     A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1,
#     D: 2, G: 2, B: 3, C: 3, M: 3, P: 3, F: 4, H: 4, V: 4, W: 4,
#     Y: 4, K: 5, J: 8, X: 8, Q: 10, Z: 10
#   }
#   result = []
#   str.upcase.chars.each do |letter|
#     result << table[letter.to_sym]
#   end
#   p result.sum
# end

# redo with hash of arrays

# def scrabble(str)
#   table = {
#     ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
#     ["D", "G"] => 2,
#     ["B", "C", "M", "P"] => 3,
#     ["F", "H", "V", "W", "Y"]=> 4,
#     ["K"]=> 5,
#     ["J", "X"]=> 8,
#     ["Q", "Z"]=> 10
#   }
#   result = []

#   str.upcase.chars.each do |letter|
#     table.each do |k, v|
#       result << v if k.include?(letter)
#     end
#   end

#   # OR USE A LOOP
#   # index = 0

#   # loop do
#   #   table.each do |k, v|
#   #     result << v if k.include?(str[index])
#   #   end
#   #   index += 1
#   #   break if index == str.size
#   # end


#   p result.sum
# end

# need to iterate through the table hash
# if the


# p scrabble("HAPPY") == 15
# p scrabble("JOHN") == 14
# p scrabble("A") == 1



# WORD PROBLEM:
=begin
Write a program that takes a word problem and returns the answer as an integer.

Problem:
- convert a sentence into a math equation


Questions?
What should the return value be? A new object or mutate the argument?
- return value should be a new integer object

Implicit / Explicit requirements:
- four words correspond to four math operators:
  - plus == +
  - minus == -
  - divided == /
  - multiplied == *
- can only have two numbers. numbers are separated by the operator keyword
- negative numbers are valid inputs. return value can also be negative

Input: a string (a math word problem)
Output: an integer (the result of the math problem )

Examples/Test Cases?

Data Structure

Algorithm
- initialize 3 variables
-- number 1
-- number 2
-- operator
- extract the numbers from the string
- extract the operator from the string
- perform the math operation
=end

# def word_to_i(str)
#   array = str.split[2..-1]
#   num1 = array[0].to_i
#   num2 = array[-1].to_i

#   if array[1..-2].include?("plus")
#     return num1 + num2
#   elsif array[1..-2].include?("minus")
#     return num1 - num2
#   elsif array[1..-2].include?("divided")
#     return num1 / num2
#   elsif array[1..-2].include?("multiplied")
#     return num1 * num2
#   end

#   # operator = array[1..-2]

#   # p num1
#   # p num2


# end

# p word_to_i("What is 5 plus 13") == 18
# p word_to_i("What is 7 minus 5") == 2
# p word_to_i("What is 33 divided by -3") == -11
# p word_to_i("What is -3 multiplied by 25?") == -75



# SUBSTRINGS:
=begin
Write a method that returns a list of all substrings of a string.

Problem:
- return a list of substrings


Questions?
What should the return value be? A new object or mutate the argument?
- return value should be a new argument
What happens if the input is an empty string/hash/array?

Implicit / Explicit requirements:
- what is a substring?
-- one or more characters
- iteration must start at index 0 and end until the last character is put into the array by itself
- need to add one character on each iteration

Input: a string
Output: an array containing all substrings in order of index

Data Structure
- an array

Algorithm
- split the string into an array
- iterate through the array and extract all substrings into a new array
-- iteration starts at index 0
- iterate through the index until -1 so that all substrings are created

=end

def substrings(str)
  array = []
  new_str = str.chars

  index = 0
  loop_end = 0
  loop_start = 0

  loop do
    loop do
      array << new_str[loop_start..loop_end].join
      break if loop_end == str.size - 1
      loop_end += 1
    end
    loop_end = index
    index += 1
    loop_start += 1
    break if loop_start == str.size
  end

  array.delete("")
  array
end

p substrings("abcde") #== [
#   "a", "ab", "abc", "abcd", "abcde",
#   "b", "bc", "bcd", "bcde",
#   "c", "cd", "cde",
#   "d", "de",
#   "e"
# ]



# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.

# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
# p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
# p alphabet_position("-.-'") == ""


=begin

Problem:
- each character in a string represents a position in the alphabet
- need to convert a string into a new string representing the string's position in the alphabet

Questions?
What should the return value be? A new object or mutate the argument?
-- return value should be a new object
What happens if the input is an empty string/hash/array?
-- return an empty string

Implicit / Explicit requirements:
- upper case and lower case letters are treated the same
- non letters like `'` and `!` are ignored
- integers need to be put in a string and separated by a space

Input: a string
Output: a string of numbers representing a letter's poosition in the alphabet

Examples/Test Cases?

Data Structure

Algorithm
- create a hash containing key value pairs (a: 1) representing the letter's position in n the alphabet
- initialize a new empty string / array?
- iterate through the argument and analyze each letter
- referencing the letter's position in the alphabet, insert the corresponding integer into the string. this is the return value
-- maybe an array?

=end

# def alphabet_position(str)
#   alphabet = ("a".."z").to_a

#   hash = {}

#   array = []

#   alphabet.each_with_index do |letter, idx|
#     hash[letter] = (idx+1)
#   end

#   str.downcase.chars.each do |letter|
#     if alphabet.include?(letter)
#       array << hash[letter]
#     end
#   end

#   array.join(' ')
# end






# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.

# p solution(10) == 23 # [3, 5, 6, 9]
# p solution(20) == 78 # [3, 5, 6, 9, 10, 12, 15, 18]
# p solution(200) == 9168

# Problem:
# - need to identify the mulitples of 3 or 5 below input number
# - return the sum

# Questions?
# - what is a natural number? > assume an integer
# What should the return value be? A new object or mutate the argument?
# - a new integer object
# What happens if the input is an empty string/hash/array?
# - assume 0 returns 0 ?
# - what if the argument is below 3? what happens with 1 or 2?

# Implicit / Explicit requirements:
# - numbers to be summed must be multiple of 3 or 5 (%)
# - need to calculate up to argument but not include argument
# - a multiple can only be counted once... dont include the same number twice

# Input: an integer representing the highest number
# Output: the sum of the integers that are multiples of 3 or 5 below the highest number

# Examples/Test Cases?

# Data Structure
# - array

# Algorithm
# - iterate through input number
# - identify if the number is divisible by 3 or 5 (use %?)
# - initialize a new array
# - put divisible numbers into array. make sure numbers are unique
# - sum the array and return this value

def solution(num)
  array = []
  (1...num).each do |n|
    array << n if n % 3 == 0 || n % 5 == 0
  end
  array.sum
end

p solution(10) == 23  #[3, 5, 6, 9]
p solution(20) == 78  #[3, 5, 6, 9, 10, 12, 15, 18]
p solution(200) == 9168
#