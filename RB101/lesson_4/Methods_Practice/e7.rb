# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the block's return value is the last line... num.odd? which returns two truthy
# values (1 and 3). the return value is determined by the last line of the block
# (or does that only apply to methods??) -- it applies to blocks and methods so
# puts num is not evaluated and num.odd? is

# the return value of any is true

# could not figure out the output... not mentioned in the ruby docs

# LS Answer:
# puts num is still run so this is still part of the output. it is not ignored even
# though it doesn't affect the return value
# any checks each iteration to see if any of them evaluates to true... which it does
# on the first iteration so only 1 is output 

