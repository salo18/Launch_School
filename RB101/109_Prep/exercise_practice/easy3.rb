# 1

# def included?
#   array = []
#   puts "Enter the 1st number:"
#   num = gets.chomp.to_i
#   array << num

#   puts "Enter the 2nd number:"
#   num = gets.chomp.to_i
#   array << num

#   puts "Enter the 3rd number:"
#   num = gets.chomp.to_i
#   array << num

#   puts "Enter the 4th number:"
#   num = gets.chomp.to_i
#   array << num

#   puts "Enter the 5th number:"
#   num = gets.chomp.to_i
#   array << num

#   puts "Enter the last number:"
#   num = gets.chomp.to_i

#   if array.include?(num)
#     puts "The number #{num} appears in #{array}."
#   else
#     puts "The number #{num} does not appear in #{array}."
#   end
# end
# included?

# 2

# def operators
#   puts "Enter the first number:"
#   first_num = gets.chomp.to_i

#   puts "Enter the second number:"
#   second_num = gets.chomp.to_i

#   puts "#{first_num} + #{second_num} = #{first_num + second_num}"
#   puts "#{first_num} - #{second_num} = #{first_num - second_num}"
#   puts "#{first_num} * #{second_num} = #{first_num * second_num}"
#   puts "#{first_num} / #{second_num} = #{first_num / second_num}"
#   puts "#{first_num} % #{second_num} = #{first_num % second_num}"
#   puts "#{first_num} ** #{second_num} = #{first_num ** second_num}"
# end
# operators

# # 3
# def word
#   puts "Please type one or more words"
#   input = gets.chomp
#   input.delete(" ").size
# end
# p word

# 4
# def multiply(num1, num2)
#   num1 * num2
# end
# # p multiply(5, 3) == 15

# # 5
# def square(n)
#   multiply(n, n)
# end

# def exponent(num, power)
#   multiply(num, num**(power - 1))
# end

# p exponent(5, 4)

# 5
# def xor?(con1, con2)
#   arr = []
#   if con1 == true
#     arr << true
#   end
#   if con2 == true
#     arr << true
#   end
#   arr.size == 1 ? true : false
# end

# def xor?(val1, val2)
#   if val1 == true && val2 == false
#     return true
#   elsif val1 == false && val2 == true
#     return true
#   else return false
#   end
# end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

# 6
# def oddities(arr)
# FIRST
  # result = []
  # arr.each_with_index do |el, idx|
  #   result << el if idx.even?
  # end
  # result

# SECOND
  # result = []
  # index = 0
  # while index < arr.size
  #   result << arr[index]
  #   index += 2
  # end
  # result

# THIRD
  # arr.select do |el|
  #   arr.index(el).even?
  # end
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# 7
# def palindrome?(str)
#   str.reverse == str
# end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true

# 8
# def real_palindrome?(str)
#   aleph = []
#   ("a".."z").to_a.each do |letter|
#     aleph  << letter
#   end
#   ("0".."9").to_a.each do |num|
#     aleph << num
#   end

#   alphanumeric_string = str.downcase.chars.select do |letter|
#     aleph.include?(letter)
#   end

#   alphanumeric_string == alphanumeric_string.reverse
# end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# 9
def palindromic_number?(num)
  num.to_s.reverse == num.to_s
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true