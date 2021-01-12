# write a one-line program that creates the following output 10 times, with the
# subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

# can't figure out how to write a one liner... so trying to write any version that works
# couldn't figure out how to increment rjust each turn of the loop
count = 10
# string = "The Flintstones Rock"

# loop do
#   puts string.rjust(20)
#   count -= 1
#   break if count == 0
# end


count.times {|number| puts (" " * number) + "The Flintstones Rock!"}