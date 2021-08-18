# 1
=begin
- need to iterate through the array
- for each word in the array, need to take out the vowels
- needs to be a destructive method call
algo:
- initialize an array containing upper and lower case vowels
- iterate through input array. select for characters that are not included in the vowels array
-
=end
# ["green", "YELLOW", "black", "white"]
# def remove_vowels(arr)
#   vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
#   arr.map! do |word|
#     word.chars.map! do |letter|
#       letter unless vowels.include?(letter)
#     end
#   end

#   arr.map! do |word|
#     word.select do |letter|
#       letter != nil
#     end
#   end

#   arr.map! do |word|
#     word.join
#   end
#   arr
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# 2
=begin
Problem:
- need to find the index of the fibonacci number that has the input number of digits
Input:
- an integer representing the number of digits

Output:
- the index where the input number of digits first appears in the sequence

Implicit / Explicit requirements:
- fibonacci sequence is where the current number is the sum of the two numbers before it
- starts with index 1 not index 0
- argument is always greater than or equal to 2... so always looking at 2 digits or greater

Algorithm
- create the fibonacci sequence using a loop
  - initialize an array containing the first 2 numbers of the sequence -- 1 and 1
  - next number in the sequence is the two numbers before it
  - increment the index by 1
  - break if number is the same size as input digits
  - return the index of the number where the sequence stopped
=end

# def find_fibonacci_index_by_length(digits)
#   fibo = [1, 1]
#   index = 2
#   loop do
#     fibo << (fibo[(index-1)] + fibo[index-2])
#     break if fibo[index].to_s.size == (digits)
#     index +=1
#     # break if fibo[index].to_s.size == (digits - 1)
#   end
#   fibo.size
# end
# # p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# # p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# # p find_fibonacci_index_by_length(10) == 45
# # p find_fibonacci_index_by_length(100) == 476
# # p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) #== 47847

# 3
# method must mutate the caller
# def reverse!(arr)
#   start_index = 0
#   end_index = arr.size - 1
#   while start_index < arr.size/2
#     arr[start_index], arr[end_index] = arr[end_index], arr[start_index]
#     start_index += 1
#     end_index -= 1
#   end

#   arr
# end

# p reverse!([1,2,3,4]) #== [4, 3, 2, 1]
# p reverse!(%w(a b e d c)) #== ["c", "d", "e", "b", "a"]

# 4
