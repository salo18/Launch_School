# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# pop will remove the last element of the array and returned the removed element
# size will return the number of remaining elements in the array, which is 2

# wrong...
# .size relates to the array element that was popped off the array...
# so it is getting the size of 'caterpillar'
