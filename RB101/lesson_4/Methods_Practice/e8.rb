# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# .take returns the first n number of array elements
# the documentation does not say if the method is destructive or not... my guess
# is that it is not destructive but the only way to know is to test it?

# after testing... #take is not destructive 