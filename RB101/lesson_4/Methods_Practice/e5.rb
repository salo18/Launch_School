# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# shift returns a new array of the first hash key value pair and removes that pair
# from the original hash

# the return value will be [a, "ant"]