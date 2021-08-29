=begin
The maximum sum subarray problem consists of finding the maximum sum of a consecutive subsequence
in an array of integers.

Example:
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #=> [4, -1, 2, 1]

The easy case is when the array is made up of only positive numbers and the maximum sum is the sum of
the whole array. If the array is made up of negative numbers, return 0 instead.

An empty array is considered to have zero greatest sum. Note that the empty array is also a valid
subarray.

Problem:
- need to find the subarray of consecutive integers that has the highest sum

Input: an array of positive and negative integers
Output: an integer that represents the highest sum of a consecutive subarray
Implicit / Explicit requirements:
- a subarray is any number of consecutive integers present inside of an array
  >> [1, 2, 3] >> [[1], [1, 2], [1, 2, 3], [2], [2, 3], [3]]
- need to find the maximum sum of the subarray

Algorithm
- create an array containig all possible sub arrays
- sum each subarray
- return the max value inside the array of summed subarrays
=end

def max_sequence(arr)
  if arr.empty? || arr.all? {|i| i <= 0}#(arr.size == 1 && arr[0] < 0)
    return 0
  end

  sub_arrays = []
  # # # inner_index = 0
  # # # outter_index = 0
  # # # loop do
  # # #   loop do
  # # #     sub_arrays << arr[inner_index..outter_index]
  # # #     outter_index += 1
  # # #     break if outter_index == arr.size
  # # #   end
  # # #   inner_index += 1
  # # #   outter_index = inner_index
  # # #   break if inner_index == arr.size
  # # # end

  # using each_with_index
  index = 0
  loop do
    arr.size.times do |idx|
      sub_arrays << arr[index..idx]
    end
    index += 1
    break if index == arr.size
  end
  sub_arrays.delete_if {|el| el.empty?}

  # summed_subs = sub_arrays.map do |sub|
  #   sub.sum
  # end
  # summed_subs.max

  # what if I had to return the sub array of integers, not the sum itself?
  summed_subs = sub_arrays.sort!.map do |sub|
    sub.sum
  end
  max = summed_subs.max
  idx = summed_subs.index(max)
  sub_arrays[idx]
end

# p max_sequence([]) #== 0
# p max_sequence([-1, -1, -3])
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) #== 6
# p max_sequence([11]) #== 11
# p max_sequence([-32]) #== 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) #== 12



# 2
=begin
Write a method to find the longest common prefix string amongst an array of strings. If there is
no common prefix, return an empty string,

All given inputs are in lowercase letters a-z.

Problem:
- need to find the longest common prefix string

Input: an array of strings
Output: a string representing the longest common prefix

Implicit / Explicit requirements:
- longest common prefix... prefix starts from left to right
  - index order matters
  - when the index at index X no longer matches on all strings, that is when the prefix ends

Algorithm
- initialize empty string `result`
- need to build a new string by comparing the indexes of all strings
  - only compare X number of times where X is the size of the smallest string
  - if index 0 matches, put index 0 into result string
    - how to compare the 0 index of all array elements?
      - arr[0][0] arr[1][0] arr[2][0]
  - do this until the indexes no longer match or surpassed the size of the smallest string

=end

def common_prefix(arr)
  result = ""
  # # sizes = arr.map do |str|
  # #   str.size
  # # end
  # # iterations = sizes.min

  iterations = arr.min_by {|str| str.size}.size

  # index = 0
  # loop do
  #   letters = arr.map do |word|
  #     word[index]
  #   end
  #   index += 1
  #   if letters.uniq.size == 1
  #     result << letters[0]
  #   end
  #   break if letters.uniq.size != 1 || index == iterations
  # end
  # result

  # LS answer - both are correct but just want to try
  (0...iterations).each do |index|
    current_char = arr[0][index]
    if arr.all? {|str| str[index] == current_char}
      result << current_char
    else
      return result
    end
  end
  result
end

p common_prefix(["flower", "flow", "fliwht"]) #== "fl"
p common_prefix(["dog", "racecar", "car"]) #== ""
p common_prefix(["interspecies", "interstellar", "interstate"]) #== "inters"
p common_prefix(["throne", "dungeon"]) #== ""
p common_prefix(["throne", "throne"]) #== "throne"


  # iterations.times do |i|
  #   # first_word[i]
  #   arr.each_with_index do |str, idx|
  #   result << first_word[i] if str[i] == first_word[i]
  #   break if str[i] != first_word[i]
  #   end
  # end

  # arr.each_with_index do |str, idx|
  #   result << first_word[idx] if str[idx] == first_word[idx]
  #   # break if str[idx] != first_word[idx]
  #   p str
  #   p idx
  # end

  # arr.each_with_index do |str, idx|
  #   result << str[idx] if arr[idx] == str[0]
  # end
  # result

  # index = 0
  # arr.each do |word|
  #   if word[0]
  # end


  # arr_el = arr.size

  # loop do
  #   iterations.times do |i|
  #     arr
  #   end
  # end


  # first_word = arr[0]

  # index = 0
  # loop do
  #   bool = arr.all? do |word|
  #     # p word
  #     word[index] == first_word[index]
  #   end
  #   p bool
  #   result << first_word[0] if bool
  #   index += 1
  #   break if index == iterations
  # end