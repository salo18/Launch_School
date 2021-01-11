# write a method that computes the square of its argument (the square is the
# result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num1)
#  multiply(num1, num1)
  num1 ** num1
end

puts square(5)
puts square(-8)