# Write a method that takes two Array arguments in which each Array contains a list
# of numbers, and returns a new Array that contains the product of each pair of
# numbers from the arguments that have the same index. You may assume that the
# arguments contain the same number of elements.

# using a loop
# def multiply_list(arr1, arr2)
#   index = 0
#   new_arr = []
#   loop do
#     product = arr1[index] * arr2[index]
#     new_arr << product
#     index += 1
#     break if index == arr1.size
#   end
#   new_arr
# end
# this works

# using a method
# def multiply_list(arr1, arr2)
#   products = []
#   arr1.each_with_index do |item, index|
#     products << item * arr2[index]
#   end
#   products
# end
# this works


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


