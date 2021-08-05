
# Given a string, produce a new string with every other word removed

# Problem:
# - need to create a new string with every other word removed

# Questions?
# - What should the return value be? A new object or mutate the argument?
# --- in this case, return a new string
# - what is "every other" in this case? assuming that index 0 is the start
# - what if it is an empty string?
# - what if the string only has one word?

# Implicit / Explicit requirements:
# - a string is taken as an argument and a new string is returned
# - this will revolve around the index of the string in an array

# Input: a string
# Output: a new modified string with every other word removed

# Examples/Test Cases?

# Data Structure
# - convert string into an array and back to string?

# Algorithm
# - initialize a new array
# - convert the string into an array and iterate through the array
# - if the index is odd, add to the new array
# - return the new array

# def every_other(str)
#   arr = []
#   str.split.each_with_index do |word, idx|
#     arr << word if idx.even?
#   end
#   arr.join(" ")
# end

# p every_other("Hey there it's Bob") == "Hey it's"
# p every_other("") == ""
# p every_other("Hey") == "Hey"







# Imagine a sequence of consecutive even integers beginning with 2. The integers are
# grouped in rows, with the first row containing one integer, the second row two
# integers and so on. Given an integer representing the number of a particular row,
# return an integer representing the sum of all the integers in that row.

# Problem:
# -
# 2
# 2 4
# 2 4 6
# 2 4 6 8
# 2 4 6 8 10

# Questions?
# - What should the return value be? A new object or mutate the argument?
# --- new object
# - does consecutive even integers mean + 2 each time? assuming yes
# - how do we treat 0? 0 should return 0?
# - assuming we dont have to deal with negative numbers

# Implicit / Explicit requirements:
# - consecutive even integers means that we add 2 each time
# - integer does not repeat as it moves up in a row?

# Input: an integer representing a row
# Output: an integer representing the sum of all integers in that row

# Examples/Test Cases?

# Data Structure
# - array

# Algorithm
# - initialize an array
# - initialize an index variable that points to 0 or 2?
# - x number of times, increase the value of the index and add to the array
# - add up the values in the array and return the integer value of the addition

# Code


# def rows(num)
#   arr = []
#   idx = 0
#   num.times do |n|
#     idx += 2

#     arr << idx
#   end
#   arr.sum
# end

# p rows(0) == 0
# p rows(1) == 2
# p rows(2) == 6
# p rows(5) == 30

# 1 = 2
# 2 = 4, 6
# 3 = 8, 10, 12
# 4 = 14, 16, 18, 20
# 5 = 22, 24, 26, 28, 30
# 6 = 32, 34, 36, 38, 40, 42
# 7 = 44, 46, 48, 50, 52, 54, 56
# [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# -- need to determine the number that starts the row
# ----- 8 starts row 3 and has 3 numbers
# ----- 14 starts row 4 and has 4 numbers etc etc
# >>> get the last x elements in the array using [-row number..-1]
#

# row 1 starts at inded 0 + 1 array element ends at index 0
# row 2 starts at index 1 + 2 array elements ends at index 2
# row 3 starts at index 3 + 3 array elements ends at index 5
# row 4 starts at index 6 + 4 array elements ends at index 9
# >>> how to populate the array?

# arr = []
# idx = 0
# (4+1).times do |n|
#   arr << idx += 2
# end

# row = 5
# arr = []
# idx = 0
# loop do
#   row.times do |x|
#     arr << idx += 2
#   end
#   row -= 1
#   break if row == 0
# end


# arr = []
# 3.times do |n|
#   arr << idx += 2
# end

# - given the row number, populate an array with X number of consecutive even integers
# - pop out the last x number of array elements into their own array and that is the row


# - initialize an array
# - initialize a variable `idx` that points to 0

# Algorithm
# initialize a variable that corresponds to the integer passed in as a parameter
# initialize an empty array
# initialize an `idx` variable pointing to 0
# iterate through x number of times and populate the array with consecutive even integers
#   - break the loop when row == 0
# get the last x elements in the array using [-row number..-1] and put into a new array
# return the sum of this new array



def rows(num)
row = num
arr = []
idx = 0
  loop do
    break if row == 0
    row.times do |_|
      arr << idx += 2
    end
    row -= 1
    # break if row == 0
  end

  new_arr = arr[-num..-1].sum
end

# 1 = 2
# 2 = 4, 6
# 3 = 8, 10, 12
# 4 = 14, 16, 18, 20
# 5 = 22, 24, 26, 28, 30
# 6 = 32, 34, 36, 38, 40, 42
# 7 = 44, 46, 48, 50, 52, 54, 56

# another option:
# [
#   [2],
#   [4, 6],
#   [8, 10, 12],
#   [16, 18, 20, 22]
# ]

# def rows(num)
#   arr = []

# end

p rows(0) == 0
p rows(1) == 2
p rows(2) == 10
p rows(4) == 68
p rows(7) == 350

