

def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

#  Something about the limit variable. What's wrong with the code?
# How would you fix this so that it works?

# the limit variable is initialized outside the method
# methods are self contained. the variable needs to be moved inside the method for the
# scope to be correct and for the method to be able to access the variable

