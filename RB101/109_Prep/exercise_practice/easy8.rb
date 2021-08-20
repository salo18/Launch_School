# 1
=begin
- initialize a new empty array
- loop through input array
  -  need to add up the addition of each array element in ascending order
    - [3, 5, 2]
      - 3, 3+5, 3+5+2
    - index 0 / index 0 + index 1 / index 0 + index 1 + index 2
  - << index 0 element on first iteration
  - << index 1 + new_arr[0] on second iteration
  - << index 2 + new_arr[1] on third iteration
  - pop each index after it is used
  - do this until array is empty
=end
# def sum_of_sums(arr)
#   # index = 0
#   # new_arr = []
#   # loop do
#   #   new_arr << arr[0..index].sum
#   #   index += 1
#   #   break if index == arr.size
#   # end
#   # new_arr.sum

#   total_sum = 0
#   each_sum = 0

#   arr.each do |num|
#     each_sum += num
#     total_sum += each_sum
#   end
#   total_sum
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# 2
# puts "Enter a noun:"
# noun = gets.chomp
# puts "Enter a verb:"
# verb = gets.chomp
# puts "Enter a adjective:"
# adjective = gets.chomp
# puts "Enter a adverb:"
# adverb = gets.chomp

# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious"

# 3
# def leading_substrings(str)
#   # arr = str.chars
#   # index = 0
#   # new_arr = []
#   # loop do
#   #   new_arr << arr[0..index].join
#   #   index += 1
#   #   break if index == arr.size
#   # end
#   # new_arr

#   result = []
#   0.upto(str.size - 1) do |index|
#     result << str[0..index]
#   end
#   result

# end

# p leading_substrings('abc') #== ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# 4

# def substrings(str)
#   result = []
#   str_start = 0
#   loop do
#     str_start.upto(str.size - 1) do |index|
#       result << str[str_start..index]
#     end
#     str_start += 1
#     break if str_start == (str.size)
#   end
#   result
# end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# 5
# def palindromes(str)
#   result = []
#   str_start = 0
#   loop do
#     str_start.upto(str.size - 1) do |index|
#       result << str[str_start..index]
#     end
#     str_start += 1
#     break if str_start == (str.size)
#   end
#   result.select! do |str|
#     str == str.reverse && str.size > 1
#   end
#   result
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# 6
# def fizzbuzz(num1, num2)
#   result = []
#   num1.upto(num2) do |index|
#     if index % 3 == 0 && index % 5 == 0
#       result << "FizzBuzz"
#     elsif index % 5 == 0
#       result << "Buzz"
#     elsif index % 3 == 0
#       result << "Fizz"
#     else
#       result << index
#     end
#   end
#   result.join(" ")
# end

# p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# # 7
# def repeater(str)
#   result = str.chars.map do |char|
#     char * 2
#   end
#   result.join
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

# 8
# def double_consonants(str)
#   exclude = ["a", "e", "i", "o", "u"]
#   alphabet = ("a".."z").to_a + ("A".."Z").to_a - exclude - exclude.map(&:upcase)

#   result = str.chars.map do |char|
#     if alphabet.include?(char)
#       char * 2
#     else
#       char
#     end
#   end
#   result.join
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# # 9
# def reversed_number(num)
#   # reverse = num.to_s.reverse.chars
#   # loop do
#   #   reverse.shift if reverse[0] == "0"
#   #   break if reverse[0] != "0"
#   # end
#   # # reverse.map(&:to_i).join.to_i
#   # reverse.join.to_i

#   num.to_s.reverse.to_i
# end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

# 10
# def center_of(str)
#   middle = str.size / 2
#   if str.size.even?
#     str[(middle-1)..middle]
#   elsif str.size.odd?
#     str[middle]
#   end
# end

# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'