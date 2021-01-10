# How would you search this Array to find the first element whose value exceeds 8?

# use bsearch

a = [1, 4, 8, 11, 15, 19]

puts a.bsearch {|x| x > 8}