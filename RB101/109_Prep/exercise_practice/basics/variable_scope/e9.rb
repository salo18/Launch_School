a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

# this is an example of variable shadowing... the block parameter `a` is the same
# as the local variable `a` initialized on line 1.

# `a` remains 7 since it is never passed in to #each due to the variable shadowing