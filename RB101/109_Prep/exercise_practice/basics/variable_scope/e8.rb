
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# this outputs an error message -- local variable `a` undefined.
# `a` is initialized in the inner scope of the #each method invocation and has a scope
# that is local to that block