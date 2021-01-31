# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# from the ruby documentation:
# Returns a new Array whose elements are all those from self for which the block
# returns false or nil:
# all the values in the array are truthy so .reject will return an empty array

# WRONG.... puts num gives a return value of nil (puts returns nil)...
# so all values are returned in a new array 