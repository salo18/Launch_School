# Write a method that returns an Array that contains every other element of an Array that
#  is passed in as an argument. The values in the returned list should be those values
# that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# pseudocode
# loop through .each_with_index and assign each element an odd number
# only print odd index values?

# def oddities(array)
#   array.select.with_index {|x, idx| idx.even?}
# end
# this is correct

# needs to be idx.even because the index stars at 0... so to get "odd values", need to
# get the even idx

# LS answer
def oddities(array)
  odd_elements = []
  index = 0

  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end


puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []