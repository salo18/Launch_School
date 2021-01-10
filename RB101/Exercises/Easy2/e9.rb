# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?

# this should print out BOB and BOB
# upcase! mutates the caller and will thus also mutate save_name because it is
# pointing to the same value as name. There is no variable reassignment 

