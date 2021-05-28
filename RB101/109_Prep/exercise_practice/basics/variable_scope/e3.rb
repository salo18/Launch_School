# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# a is still 7... a new local variable `a` is initialized inside my_value
# to point to the method parameter `b`. A variable initialized inside a method
# definition is not accessible outside the method definition
# local variable `a` is not accessible inside the method because methods
# are self contained with respect to variables
