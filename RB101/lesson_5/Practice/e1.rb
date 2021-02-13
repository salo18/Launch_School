# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# def reverse_sort(array)
#   new_arr = array.map do |num|
#     num.to_i
#   end
#   new_arr.sort.reverse
# end

# p reverse_sort(arr)
# this solution works

# LS answer
p arr.sort do |a,b|
  b.to_i <=> a.to_i
end