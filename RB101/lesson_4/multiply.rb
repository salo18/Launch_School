my_numbers = [1, 4, 3, 7, 2, 6]

# method that mutates the caller
# def multiply(numbers, multiplier)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     numbers[counter] *= multiplier

#     # current_number = numbers[counter]
#     # current_number *= multiplier

#     counter += 1
#   end
#   p numbers
# end

# method that doesn't mutate the caller... creates a new array
def multiply(numbers, multiplier)
  counter = 0
  new_numbers = []

  loop do
    break if counter == numbers.size
    new_numbers << numbers[counter] *= multiplier
    counter += 1
  end
  p new_numbers
end

multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
