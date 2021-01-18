# What will be printed by each of these code groups?

# A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
# one is one
puts "two is: #{two}"
# two is two
puts "three is: #{three}"
# three is three
# the variables are initialized outside the method and the method definition does
# not alter their values

# B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# same results as A... variable reassignment is taking place inside the method and
# is not affecting the outer scope variables


#
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
# one is two
puts "two is: #{two}"
# two is three
puts "three is: #{three}"
#three is one

# the method is mutating the caller and thus reflects on the variables outside of the method