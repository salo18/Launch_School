# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# numbers should print out [1, 2, 3]

# wrong -- did not think about this carefully. uniq does not mutate the caller
# so numbers stays the same
