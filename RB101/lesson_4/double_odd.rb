my_numbers = [1, 4, 3, 7, 2, 6]

# Try coding a solution that doubles the numbers that have odd indices:

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.length
    numbers[counter] *= 2 if counter.odd?
    doubled_numbers << numbers[counter]
    counter += 1
  end

  p doubled_numbers
end

# def double_odd_numbers(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.length
#     numbers[counter] *= 2 if numbers[counter].odd?
#     counter += 1
#   end

#   p numbers
# end


double_odd_numbers(my_numbers)