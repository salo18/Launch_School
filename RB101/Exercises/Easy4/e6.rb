# Write a method that takes an Array of numbers, and returns an Array with the same
# number of elements, and each element has the running total from the original Array.

# def running_total(arr)
#   sum = 0
#   new_arr = []
#   arr.each do |num|
#     new_arr << (sum + num)
#     sum += num
#   end
#   p new_arr
# end

# this is correct but not as elegant as the LS answer

# LS ANSWER:
# def running_total(arr)
#   sum = 0
#   arr.map { |value| sum += value }
# end

# using each_with_object - needed help with this one

def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |num, result|
    sum += num
    result << sum
  end
end

# using inject -- copied this -- could not figure out inject on my own

def running_total(arr)
  arr.inject([]) { |arr, n| arr << (arr.last.to_i + n) }
end



p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []