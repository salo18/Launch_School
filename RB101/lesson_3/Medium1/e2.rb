# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# 1) add variables
# num1 = 40
# num2 = 2
# puts "the value of #{num1} + #{num2} is #{num1+num2}"

# 2)
puts "the value of 40 + 2 is " + (40 + 2).to_s