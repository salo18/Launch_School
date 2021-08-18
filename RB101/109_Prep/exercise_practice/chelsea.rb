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


# p left_equals_right([1, 2, 3, 4, 3, 2, 1]) #== 3
# p left_equals_right([1, 100, 50, -51, 1, 1]) == 1
# p left_equals_right([100, 50, -51, 1, 1]) == -1
#p left_equals_right([20, 10, -80, 10, 10, 15, 35]) == 0




=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

Problem:
- need to convert a url into a string contaning just the domain name

Input:
- a string representing a url

Output:
- the domain name

Implicit / Explicit requirements:
- anything that comes in between http://, https://, wwww. and .com / .ru .jp is the domain name
- domain name can contain a dash (-)
- domain name can be preceeded by a .
- domain name can be preceeedd by ://
- domain always ends with .

Algorithm
- create an array of special characters that contain the beginning or ending of a domain name (. / )
- initialize a new string
- convert the input string into an array of characters
  - iterate through that array
  - extract characters that come in between . or /  and put them into the new string
    -

- domain starts in one of four ways:
-- http://
-- https://
-- http://www.
-- https://www.
----> depending on which way the string starts, delete index 0.. size of beginning string
-- iterate through reamining string and stop when index == "."

=end

# def domain_name(string)
#   array = string.chars
#   without_begining = []
#   if string.start_with?("https://www.")
#     without_beginning = array[12..-1]
#   elsif string.start_with?("http://www.")
#     without_beginning = array[11..-1]
#    elsif string.start_with?("https://")
#     without_beginning = array[8..-1]
#   elsif string.start_with?("http://")
#     without_beginning = array[7..-1]
#   elsif string.start_with?("www.")
#     without_beginning = array[4..-1]
#   end

#   result = []
#   index = 0
#   loop do
#     if without_beginning[index] != "."
#       result << without_beginning[index]
#     end
#     index += 1
#     break if without_beginning[index] == "."
#   end
# result.join
# end

# p domain_name("http://google.com") #== "google"
# p domain_name("http://google.co.jp") #== "google"
# p domain_name("www.xakep.ru") #== "xakep"
# p domain_name("https://youtube.com") #== "youtube"
# p domain_name("http://github.com/carbonfive/raygun") #== "github"
# p domain_name("http://www.zombie-bites.com") #== "zombie-bites"
# p domain_name("https://www.cnet.com") #== "cnet"


=begin
In this kata, you must create a digital root function.

A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

Problem:
- need to break the integer into its component parts
- sum those parts
- if the size of the summation is larger than 1, do it again

Input: an integer
Output: an integer reprensenting the sum of the roots
Implicit / Explicit requirements:
- number has a size... size is the number of digits
- need to continue this process until the number is 1 digit long

Algorithm
-- define `number_size` method
  - takes the integer and determines the integer size .to_s.size?
-- if input integer size is greater than 1
  >>-- define `process` method
    - split out the integers into component parts (into an array of string characters?)
    - sum the array
-- if the new number is greater than 1, repeat the process over again
-- if not, return the new number
=end

def digital_root(number)
  until number.to_s.size == 1
    number = number.to_s.chars.map(&:to_i).sum    #{|i| i.to_i}
  end
  number
end

# def root(num)
#   num.to_s.chars.map {|i| i.to_i}.sum
# end

# p digital_root(16) #== 7
p digital_root(456) #== 6 # 4 + 5 + 6 == 15 >> 1 + 5 == 6