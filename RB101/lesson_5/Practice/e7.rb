# Given this code, what would be the final values of a and b?
# Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]
# arr = [2, [5, 8]]

arr[0] += 2
# arr = [4, [5, 8]]
arr[1][0] -= a
# arr = [4, [1, 8]]

# a = 4
# b = [1, 8]

# need to re-read variables as pointers post 
