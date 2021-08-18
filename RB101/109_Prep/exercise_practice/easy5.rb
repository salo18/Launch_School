# 1
# def ascii_value(str)
#   value = 0

#   str.chars.each do |letter|
#     value += letter.ord
#   end

#   value
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# 2
=begin
Problem:
- need to convert an integer into 24 hour format: hh:mm

Input: a positive or negative integer representing the number of minutes ahead or behind midnight
Output: a string containing the time in a 24 hour format
Implicit / Explicit requirements:
- a day consists of 24 hours
- 60 minutes per hour
- positive integer counts up from 0
- negative integer counts down from 24
- 0 input returns 0:00
- input less than 60 is just minutes
- input above 60 is hours
- time goes from 0 - 24 and there is no am/pm issues

Algorithm
- initialize a constant to point to `60.0` which represents the number of minutes per hour
- if the absolute value of the integer is less than 60, add to `0` or subtract from `24`
  - put into format helper method
- if the absolute value of the integre is greater than or equal to 60
  - use divmod to get an array containing the quotient and moodulus (remainder)
  - pass the array into format helper method
FORMAT
- input is an array
- if arr[0] is negative, need to substract down from 24
- get divmod of first array element by 24. the return value is a new array and arr[0] is the hour
- get divmod of the new array and now divmod the hour by 24
  - arr[1] is the number of minutes
- format the hour and minutes together
=end

# def time_of_day(minute)
#   return "00:00" if minute == 0

#   if minute.abs < 60
#     if minute < 0
#       if minute.to_s.chars.size > 1
#         return "23:#{60 - minute.abs}"
#       elsif minute.to_s.chars.size <= 1
#         return "23:0#{60 - minute.abs}"
#       end
#     elsif minute > 0
#       if minute.to_s.chars.size > 1
#         return "00:#{minute}"
#       elsif minute.to_s.chars.size <= 1
#         return "00:0#{minute}"
#       end
#     end
#   end
#   format(minute.divmod(60))
# end

# def format(arr)
#   minute = arr[1]
#   new_arr = arr[0].divmod(24)
#   hour = new_arr[1]

#   if hour.to_s.chars.size < 2
#     hour = "0#{hour}"
#   end

#   if minute.to_s.chars.size < 2
#     minute = "0#{minute}"
#   end

#   "#{hour}:#{minute}"

#   # [hour, minute]

# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# 3
=begin
Problem: need to convert a string representing the time of day into the number of minutes

Input: a string representing the time
Output: the number of minutes
Implicit / Explicit requirements:
- 24 hours in a day
- 60 minutes per hour

Algorithm
- need to initialize two variables representing the minute and hour
- assign these two variable to the first and second part of the string
-- separate out into an array and use array index reference
- now that we know the hours and minutes, multiply hours by 24 and add on minutes
- return 0 if str == "00:00" or str = "24:00"
=end

# def after_midnight(str)
#   return 0 if str == "00:00"
#   return 0 if str == "24:00"
#   minute = 0
#   hour = 0
#   arr = str.chars

#   minute = arr[3..4].join.to_i
#   hour = arr[0..1].join.to_i
#   (hour * 60) + minute
# end

# def before_midnight(str)
#   return 0 if str == "00:00"
#   return 0 if str == "24:00"
#   minute = 0
#   hour = 0
#   arr = str.chars

#   minute = arr[3..4].join.to_i
#   hour = arr[0..1].join.to_i
#   1440 - ((hour * 60) + minute)
# end
# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# 5
# def swap(str)
#   word_as_arr.map do |word|
#     first = word[0]
#     last = word[-1]
#     word[0] = last
#     word[-1] = first
#   end
#   word_as_arr.join(' ')
# end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# 6
=begin
- initialize alphabet array
- delete char if not in the alphabet array and replace with a string
- strip the word so there are no leading or trailing spaces then add one space at the beginning and end
--- convert to array and pop and unshift?
=end
# def cleanup(str)
#   alphabet = ("a".."z").to_a
#   result = ""

#   str.chars.each do |letter|
#     if alphabet.include?(letter)
#       result << letter
#     else
#       result << " "
#     end
#   end
#   " " + result.split.join(" ") + " "

# end

# p cleanup("---what's my +*& line?") == ' what s my line '

# # 7
# def word_sizes(str)
#   arr = str.split.map {|word| word.size}
#   hash = {}
#   arr.each do |int|
#     hash[int] = arr.count(int)
#   end
#   hash
# end
# p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!')# == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') #== {}

# 8
# def word_sizes(str)
#   alphabet = ("a".."z").to_a + ("A".."Z").to_a
#   new_arr = str.split.map do |word|
#     word.chars.select do |letter|
#       alphabet.include?(letter)
#     end
#   end
#   newnew = new_arr.map {|arr| arr.join}.join(' ')
#   arr = newnew.split.map {|word| word.size}
#   hash = {}
#   arr.each do |int|
#     hash[int] = arr.count(int)
#   end
#   hash
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

# # 9
# def alphabetic_number_sort(arr)
#   hash = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5,
#   "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9, "ten" => 10, "eleven" => 11, "twelve" => 12,
#   "thirteen" => 13, "fourteen" => 14, "fifteen" => 15, "sixteen" => 16, "seventeen" => 17, "eighteen" => 18,
#   "nineteen" => 19}

#   ordered_arr = hash.sort_by do |k, v|
#     k
#   end

#   ordered_arr.map do |arr|
#     arr.delete(arr[1])
#   end
# end


# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# 10
# def crunch(str)
#   return "" if str == ""
#   index = 0
#   new_str = ""
#   loop do
#     if str[index] != str[index - 1]
#       new_str << str[index]
#     end
#     index += 1
#     break if index == str.size
#   end
#   if new_str.empty?
#     new_str << str[0]
#   end
#   new_str
# end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# 10
=begin
Problem:
- need to print a box... box length varies on the length of the string
Input:
- a string
Output:
- a box with a string inside it
Implicit / Explicit requirements:
- corners of the box are + signs
- vertical sides of the box are lines
- horizontal sides of the box are dashes
- string needs to be printed on the middle (3rd) row

Algorithm
- create an empty box
 - initialize three variables pointing to the corresponding values associated
 with corners, walls and sides
 - use string concatenation to build the box

=end

# def print_in_box(str)
#   corner = "+"
#   wall = "|"
#   side = "-"

#   num = str.size

#   if str.size == 0
#     top = corner + side + side + side + corner
#     bottom = corner + side + side + side + corner
#     walls_top = "#{wall} #{" " * (num + 1)} #{wall}"
#     walls_middle = "#{wall} #{" " * (num + 1)} #{wall}"
#     walls_bottom = "#{wall} #{" " * (num + 1)} #{wall}"
#   end

#   if str.size >= 1
#     top = "#{corner}#{side}#{side * num}#{side}#{corner}"
#     bottom = "#{corner}#{side}#{side * num}#{side}#{corner}"
#     walls_top = "#{wall} #{" " * num} #{wall}"
#     walls_middle = "#{wall} #{str} #{wall}"
#     walls_bottom = "#{wall} #{" " * num} #{wall}"
#   end

#   p top
#   p walls_top
#   p walls_middle
#   p walls_bottom
#   p bottom
# end

# print_in_box('hey sister')
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

# # print_in_box('')
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

