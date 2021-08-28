# 1
# def rotate_array(arr)
#   result = arr[1..-1]
#   result.push(arr[0])
# end

# # p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
# # p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
# # p rotate_array(['a']) #== ['a']


# # for strings
# def rotate_string(str)
#   arr = str.chars
#   rotate_array(arr).join
# end
# # p rotate_string("hey") == "eyh"
# # for integers
# def rotate_integers(num)
#   arr = num.to_s.chars
#   rotated = rotate_array(arr)
#   rotated.join.to_i
# end
# p rotate_integers(1234) == 2341

# # x = [1, 2, 3, 4]
# # p rotate_array(x) #== [2, 3, 4, 1]   # => true
# # # x == [1, 2, 3, 4]              # => true
# # p x

# 2
=begin
Problem:
- need to "rotate" the right most digits X number of times
Input:
- integer and a number `n` which represents how many digits should be rotated
Output:
- a rotated integer
Implicit / Explicit requirements:
- rightmost rotation means the last number and the first number of a sequence should be flipped
- the sequence starts on the right most integer and is `n` integers long
- the rest of the array should remain the same
Algorithm
- convert integer into an array of characters
- identify the sequnce that needs to be iterated over
  - if num = 2 and arr.size == 7
    - arr[0..4] is the unaltered array
    - sequence == arr[5..6]
  - if num = 3 and arr.size == 7
    - arr[0..3] is unaltered array
    - sequence == arr[4..6]

- add the sequence back to the original array
=end

# first try
# def rotate_rightmost_digits(int, num)
#   arr = int.to_s.chars.map(&:to_i)
#   num_index = arr.size - num
#   sequence = arr[num_index..(arr.size-1)]
#   unaltered_arr = arr[0...num_index]

#   final_sequence = sequence[1..-1] << sequence[0]

#   result = unaltered_arr << final_sequence
#   result.flatten.join.to_i
# end

# refactored
def rotate_rightmost_digits(int, n)
  arr = int.to_s.chars.map(&:to_i)

  sequence = arr[-n..-1]
  unaltered_arr = arr[0...-n]

  final_sequence = sequence[1..-1] << sequence[0]

  result = unaltered_arr << final_sequence
  result.flatten.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
 p rotate_rightmost_digits(735291, 5) == 752913
 p rotate_rightmost_digits(735291, 6) == 352917