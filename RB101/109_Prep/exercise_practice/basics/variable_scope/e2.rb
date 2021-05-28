# What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

# the code will print 7... my_value does not mutate the caller and is only
# variable reassignment. a is not affected by this method and thus remains 7
