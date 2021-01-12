numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original
# array between method calls)?

# both methods mutate the caller 

numbers.delete_at(1)
# this deletes the number at index position 1 (2nd number)

numbers.delete(1)
# this deletes the value 1

