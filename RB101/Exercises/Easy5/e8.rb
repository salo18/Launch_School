# Write a method that takes an Array of Integers between 0 and 19, and returns an
# Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# PEDAC:
# input - an array of integers from 0 to 19
# output - an array of integers sorted based on the alphabetical order of the integers
# expressed as strings

# process:
# need to create a hash that stores that matches the numbers to their
# corresponding string. then sort the hash based on the alphabetical order
# then remove the key or value (depending on what is assigned to the string)
# return a hash with only the integers keeping the position established in the hash

# could not figure out how to execute this plan...

# LS answer is much easier using #sort_by

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number]}
# end

# further exploration using sort
def alphabetic_number_sort(numbers)
  numbers.sort { |a, b| NUMBER_WORDS[a] <=> NUMBER_WORDS[b] }
end


p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]