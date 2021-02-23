# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of the
# original Array, respectively. If the original array contains an odd number of
# elements, the middle element should be placed in the first half Array.

def halvsies(arr)
  half = (arr.size / 2)
  if arr.size.odd?
    arr.partition.with_index { |_, i| i <= half }
  else
    arr.partition.with_index { |_, i| i < half }
  end
end

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5])
p halvsies([])

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]