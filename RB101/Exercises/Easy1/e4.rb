# Write a method that counts the number of occurrences of each element in a given array

# expected ouput
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# pseudocode:
# count how many times a string is found inside an array
# assign a value to each string? use the element index?
# store this value in a hash?
# print out this hash?

# could not figure this one out...

# LS answer:

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences(vehicles)

