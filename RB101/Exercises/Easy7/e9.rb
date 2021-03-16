# Write a method that takes two Array arguments in which each Array contains a list
# of numbers, and returns a new Array that contains the product of every pair of
# numbers that can be formed between the elements of the two Arrays. The results
# should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# def multiply_all_pairs(arr1, arr2)
#   product = []
#   arr1.each do |item1|
#     arr2.each do |item2|
#       product << item1 * item2
#     end
#   end
#   product.sort
# end
# LS solution


# def multiply_all_pairs(arr1, arr2)
#   index1 = 0
#   index2 = 0
#   new_arr1 = []
#   new_arr2 = []
#   loop do
#     product = arr1[0] * arr2[index1]
#     new_arr1 << product
#     index1 += 1
#     break if index1 == arr2.size
#   end

#   loop do
#     product = arr1[1] * arr2[index2]
#     new_arr2 << product
#     index2 += 1
#     break if index2 == arr2.size
#   end

#   (new_arr1 + new_arr2).sort
# end

# this solution works but its not good code... can't figure out how to loop this so
# that it works no matter how many array items in arr1
# coming off a two week break from LS so my brain is rusty!


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

