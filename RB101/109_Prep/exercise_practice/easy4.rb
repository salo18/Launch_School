# 1
# def short_long_short(str1, str2)
#   if str1.size > str2.size
#     long = str1
#   elsif str2.size > str1.size
#     long = str2
#   end

#   if str1.size < str2.size
#     short = str1
#   elsif str2.size < str1.size
#     short = str2
#   end
#  short + long + short
#  str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1
# end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# 2
=begin
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number, and
ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise
the 20th century.

Problem:
- need to convert a number into the corresponding century

Input: an integer
Output: the century that integer belongs to
Implicit / Explicit requirements:
- new century begins on the 1st year (1901 is 20th century)
---- year that ends in 00 (turn of the century) belongs to previous century
    - 2000 is 20th century while 2001 is 21st
- the 100 year period corresponds to the n + 1 century
- input must be positive?

Algorithm
- CENTURY METHOD:
-- determine which century the number is in
-- if the century is less than 3 digits, 1st century
-- if the century doesn't end in 00, n + 1 century
-- if the century ends in 00, n century
---- 2000 == 20
---- 2001 == 21
---- 256 == 3
---- 5 == 1
---- 10103 == 102
>> return an integer the represents the century

- APPEND MODIFIER METHOD:
-- add the appropriate modifier to each integer
RULE
if ends in...
- 1 => 1st
- 2 => 2nd
- 3 => 3rd
- 4 - 0 => th
exceptions
- 11th
- 12th
- 13th

>> return the integer appended by the modifier
=end

# def century(num)
#   if num.to_s.chars.size < 3
#     pure_century = 1
#   end

#   size = num.to_s.chars.size - 1

#   if num.to_s[-2..-1] == "00"
#     pure_century = num.to_s[0..(size - 2)].to_i
#   else
#     pure_century = num.to_s[0..(size - 2)].to_i + 1
#   end

#   append_modifier(pure_century)
# end

# def append_modifier(num)
#   return "#{num}th" if num.to_s[-2..-1] == "11" || num.to_s[-2..-1] == "12" || num.to_s[-2..-1] == "13"

#   if num.to_s[-1] == "1"
#     return "#{num}st"
#   elsif num.to_s[-1] == "2"
#     return "#{num}nd"
#   elsif num.to_s[-1] == "3"
#     return "#{num}rd"
#   else
#     return "#{num}th"
#   end
# end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

# 3

=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly
divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100,
then it is not a leap year unless the year is evenly divisible by 400.

- leap year ...
-- if divisible by 4
---- unless also divisible by 100
-- if divisible by 100
---- only leap year if also divisible by 400
>> return true if a leap year
=end

# def leap_year?(year)

#   if (year % 4 == 0) && (year % 100 == 0)
#     return false
#   elsif (year % 4 == 0)
#     return true
#   elsif (year % 4 == 0 && year % 100 == 0 && year % 400 == 0)
#     return true
#   else
#     return false
#   end

#   if year % 400 == 0
#       true
#     elsif year % 100 == 0
#       false
#     else
#       year % 4 == 0
#     end
#   end

# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) #== false
# # p leap_year?(2400) == true
# # p leap_year?(240000) == true
# # p leap_year?(240001) == false
# # p leap_year?(2000) == true
# # p leap_year?(1900) == false
# # p leap_year?(1752) == true
# # p leap_year?(1700) == false
# # p leap_year?(1) == false
# # p leap_year?(100) == false
# # p leap_year?(400) == true

# 4
# def multisum(num)

#   result = (1..num).select do |n|
#     n % 3 == 0 || n % 5 == 0
#   end

#   result.sum
# end
# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

# 5
# def running_total(arr)
#   # result = []
#   # index = 0
#   # arr_value = 0
#   # return arr if arr.empty?
#   # loop do
#   #   arr_value += arr[index]
#   #   result << arr_value
#   #   index += 1
#   #   break if index == arr.size
#   # end
#   # result

#   # sum = 0
#   # arr.map {|n| sum += n}

#   total = 0
#   arr.each_with_object([]) {|val, array| array << total += val }
# end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

# 6
# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(str)
#   result = []
#   str.chars.each do |s|
#     result << DIGITS[s]
#   end
#   result.join
# end
# p string_to_integer('4321') #== 4321
# p string_to_integer('570') #== 570


