# Write a method which takes a grocery list (array) of fruits with quantities and converts
# it into an array of the correct number of each fruit.

# def buy_fruit(arr)
#   new_arr = []
#   arr.each do |fruit|
#     fruit[1].times do
#       new_arr <<  fruit[0]
#     end
#   end
#   new_arr
# end

# LS answer:
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]