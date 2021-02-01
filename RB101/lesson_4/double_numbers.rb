my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(numbers)
  # new_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end
  p numbers
end

double_numbers(my_numbers)