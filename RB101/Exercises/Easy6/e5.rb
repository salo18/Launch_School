# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

# def reverse(arr)
#   new_arr = []
#   right_index = -1

#   index = arr.size

#   until index == 0
#     new_arr << arr[right_index]
#     right_index -= 1
#     index -= 1
#   end
#   new_arr
# end
# this works!

# further exploration:
def reverse(arr)
  arr.each_with_object([]) { |item, arr| arr.unshift(item) }
end



p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true

