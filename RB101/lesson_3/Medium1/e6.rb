# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# it is either 42 (50 - 8)  or 34 (42 - 8)
#

# p answer - 8 equals 34. mess_with_it does not mutate the caller so answer
# keeps its original value 