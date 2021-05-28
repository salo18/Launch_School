
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# `a` is 3
# `a` is initialized in the outer scope and is accessible in the inner scope of the
# each method call. As #each iterates over the elements in `array` and reassigns the
# value of local variable `a` to each element, `a` is reassigned. 