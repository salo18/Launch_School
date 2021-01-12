# original method
# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked
# Alan to change the loop. How can you make this work without using begin/end/until?

def factors(number)
  divisor = number
  factors = []

  loop do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor == 0
  end

  factors
end

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# number % divisor is what checks that the number is actually a divisor. if the number
# has a remainder other than 0, then it isn't a factor

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
#  factors at the end of the method makes sure that the factors are returned to the screen

