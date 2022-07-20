# 1 - odd numbers
# def odd_number(num)
#   arr = (1..num).to_a

#   arr.each do |n|
#     puts n if (n % 2 == 1)
#   end
# end

# odd_number(19)

# 2 - multiples of 3 and 5
# Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.

# def multiples
#   arr = (1..100).to_a
#   arr.each do |n|
#     if n % 5 == 0 || n % 3 ==0
#       p n
#     end
#   end
# end

# multiples

# 3 - print multiples
# def log_multiples(num)
#   arr = (0..100).to_a

#   arr.each do |n|
#     p n if (n % num == 0 ) && (n % 2 == 1)
#   end
# end

# log_multiples(21)

# 4 - fizz buzz
# def fizzbuzz
#   arr = (1..100).to_a

#   arr.each do |n|
#     if n % 3 == 0 && n % 5 == 0
#       p "FizzBuzz"
#     elsif n % 3 == 0
#       p "Fizz"
#     elsif n % 5 == 0
#       p "Buzz"
#     else
#       p n
#     end
#   end
# end

# fizzbuzz

# 5 prime check
# def is_prime(num)
#   counter = 2
#   return false if num == 1 || num == 0

#   while num > counter do
#     # counter < num do
#     return false if num % counter == 0
#     counter += 1
#   end

#   true
# end

# p is_prime(0)

# 6 XOR
# def isXor(arg1, arg2)
#   if (!!arg1 == true && !!arg2 == false) || (!!arg2 == true && !!arg1 == false)
#     return true
#   else false
#   end
# end

# p isXor(false, true)     #// true
# p isXor(true, false)     #// true
# p isXor(false, false)    #// false
# p isXor(true, true)      #// false


# p isXor(false, 3)        #// true
# # p isXor('a', undefined)  #// true
# # p isXor(null, '')        #// false
# p isXor('2', 23)         #// false

# 7 guess the password

# password = 'password'

# puts "welcome! please enter the password to log in"

# tries = 3
# loop do
#   tries -= 1

#   puts "what is the password?"
#   answer = gets.chomp

#   if answer != password
#     puts "that's not the right password... you have #{tries} tries left."
#   elsif answer == password
#     puts "you have successfully logged in"
#     break
#   end

#   if tries == 0
#     puts "you have been denied access"
#     break
#   end
# end

# 8 student grade
# puts "Enter your three scores"

# score_num = 1
# scores = []

# loop do
#   loop do
#   puts "enter score #{score_num}:"
#   sc = gets.chomp.to_i
#     if (1..100).to_a.include?(sc)
#       scores << sc
#       score_num += 1
#       break
#     else
#       puts "that's not a valid score... enter a number between 0 and 100"
#     end
#   end

#   break if scores.size == 3
# end

# average = scores.reduce(:+)/3

# letter = case average
# when 90..100
#   "A"
# when 80..89
#   "B"
# when 50..79
#   "C"
# when 1..50
#   "F"
# end

# puts "Based on your average score of #{average} your grade is #{letter}"

# # 9
# def gcd(num1, num2)
#   arr = []
#   int = (1..num1).to_a

#   int.each do |n|
#     arr << n if (num1 % n == 0) && (num2 % n == 0)
#   end
#   arr.max
# end

# p gcd(12, 4)
# p gcd(15, 10)
# p gcd(9, 2)

# 10
# def is_prime?(num)
#   counter = 2
#   return false if num == 1 || num == 0

#   while num > counter do
#     return false if num % counter == 0
#     counter += 1
#   end

#   true
# end

# def find_pairs(num)
#   pairs = []

#   arr = (0..num).to_a

#   arr.each do |n|
#     pairs << n if is_prime?(n)
#   end
#   pairs
# end

# def find_sums(num)
#   return nil if (num % 2 == 1) || num < 4
#   arr = find_pairs(num)

#   all = arr.permutation(2).to_a
#   final = all.select do |pair|
#     pair[0] + pair[1] == num
#   end.flatten.uniq!

#   size = final.size

#   counter = 0
#   while (counter < size - 1)
#     p "#{final[counter]} #{final[counter + 1]}"
#     counter += 2
#   end

#   final
# end

# p find_sums(10)

# 11
# def pattern(num)
#   arr = (1..num).to_a
#   total_size = arr.join.to_s.size

#   arr.each_with_index do |n, idx|
#     break if n > num

#     stars = total_size - (arr[0..idx].join.size)

#     puts arr[0..idx].join + ("*" * stars)
#   end
# end

# pattern(20)

# 1******
# 12*****
# 123****
# 1234***
# 12345**
# 123456*
# 1234567

# 13
=begin
pedac
- iterate through the string
- find where the characters START and END
  - if the character to the left is an empty space and all other preceeding characters are spaces,
- select the range of those indexes

=end
# def trim(str)
#   first = nil
#   last = nil
#   arr = str.chars
#   arr.each_with_index do |n, idx|
#     if !arr[0..idx].all?(" ")
#       first = idx
#       break
#     end
#   end

#   arr.each_with_index do |n, idx|
#     if arr[idx..-1].all?(" ") && arr.any?(/a-z/)
#       last = idx - 1
#       break
#     end
#   end

#   if first == nil && last == nil
#     ""
#   else
#     arr[first..last].join
#   end
# end

# p trim('  abc  ');  #// "abc"
# p trim('abc   ');   #// "abc"
# p trim(' ab c');    #// "ab c"
# p trim(' a b  c');  #// "a b  c"
# p trim('      ');   #// ""
# p trim('');         #// /


# 14
# build a new string... if the character is a delimiter, skip it
# def split(str, delimiter)
#   new_str = ''

#   str.chars.each do |el|
#     # p "#{el} #{delimiter}"
#     if el != delimiter
#       new_str << el
#     elsif el == delimiter
#       puts new_str
#       new_str = ''
#     end
#   end

#   p new_str
# end

# split('abc,123,hello world', ',')
# split('hello', ',')
# split('abc,123,hello world', ',');
# // logs:
# // abc
# // 123
# // hello world

# split('hello');
# // logs:
# // ERROR: No delimiter

# split('hello', '');
# // logs:
# // h
# // e
# // l
# // l
# // o

# split('hello', ';');
# // logs:
# // hello

# split(';hello;', ';');
# // logs:
# //  (this is a blank line)
# // hello

# # 15
# def repeat(str, times)
#   new_str = ''
#   if times > 0
#     times.times do |n|
#       new_str << str
#     end
#   elsif times <= 0 || times.to_i.to_s != times
#     p "undefined"
#   end
#   p new_str if new_str.length > 0
# end

# repeat('abc', 1);       #// "abc"
# repeat('abc', 2);       #// "abcabc"
# repeat('abc', -1);      #// undefined
# repeat('abc', 0);       #// ""
# # repeat('abc', 'a');     #// undefined
# # repeat('abc', false);   #// undefined
# # repeat('abc', null);    #// undefined
# # repeat('abc', '  ');    #// undefined

# 16


