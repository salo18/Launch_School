# Using a while loop, print 5 random numbers between 0 and 99.

numbers = []


while numbers.length <= 5
  numbers << rand(100)
end

p numbers