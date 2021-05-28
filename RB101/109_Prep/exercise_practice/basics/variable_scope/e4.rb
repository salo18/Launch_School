# a = "Xyzzy"
a = 1

def my_value(b)
  b = '-'
end

my_value(a)
puts a

# this all boils down to whether or not my_value mutates the caller or not
# the [] = notation does mutate the caller so the code will output "Xy-zzy"
