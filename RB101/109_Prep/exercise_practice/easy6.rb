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
# def reverse(arr)
#   # new_arr = []
#   # return [] if arr.empty?
#   # loop do
#   #   new_arr << arr.pop
#   #   break if arr.size == 0
#   # end
#   # new_arr
# end

# p reverse([1,2,3,4]) #== [4,3,2,1]          # => true
# # p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# # p reverse(['abc']) == ['abc']              # => true
# # p reverse([]) == []                        # => true

# 5
# def merge(arr1, arr2)
#   new_arr = arr1 + arr2

#   new_arr.uniq
# end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# 6
# def halvsies(arr)
#   return [arr, []] if arr.size == 1
#   return [[],[]] if arr.size == 0
#   if arr.size.even?
#     half = (arr.size / 2) - 1
#     [arr[0..half], arr[half+1..-1]]
#   else
#     half = (arr.size / 2)
#     [arr[0..half], arr[half+1..-1]]
#   end
# end
# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

# 7
# def find_dup(arr)
#   new_arr = []
#   duplicate = 0
#   arr.each do |num|
#     if !new_arr.include?(num)
#       new_arr << num
#     else
#       duplicate = num
#     end
#   end
#   duplicate
# end

# p find_dup([1, 5, 3, 1]) #== 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73

# # 8
# def include?(arr, num)
#   arr.each do |n|
#     return true if n == num
#   end
#   false
# end
# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

# 9
# def triangle(num)
#   row = 1
#   spaces = num - row
#   num.times do
#    puts "#{'*'*row}#{" " * spaces}"
#     row += 1
#     spaces -= 1
#     break if row == (num + 1)
#   end
# end
# triangle(5)
# triangle(9)
