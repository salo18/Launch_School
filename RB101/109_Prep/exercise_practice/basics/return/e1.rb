# e1
# def meal
#   return 'Breakfast'
# end

# puts meal

# the code will output "breakfast" and the return value will be nil

# e2
# def meal
#   puts 'Dinner'
#   return 'Breakfast'
# end

# puts meal
# the code will output Dinner on one line and then breakfast on the other
#  line 12 is executed and then the method ends on line 13 which is the implicit
# and explicit return value

# e3
# def meal
#   'Dinner'
#   puts 'Dinner'
# end

# puts meal
# this code will only output "Dinner" once because the last line of code is being evaluated
# since the first Dinner doesn't have an associated p or puts method, it doesn't outpute

# e4
# def meal
#   return 'Breakfast'
#   'Dinner'
#   puts 'Dinner'
# end

# puts meal
# this will output Breakfast and the output will be nil. Everything below line 33 is ignored.

# e7
# def count_sheep
#   5.times do |sheep|
#     puts sheep
#   end
# end

# puts count_sheep
# this should result in an error since no argument is being passed in to the block parameter..
# OR... this prints nil 5 times sincee there is no argument being passed in
# WRONG... times doesn't need an argument passed in. The code will print 0-4 as instructed
# and also print 5 because that is the return value of the times method

# e8
# def count_sheep
#   5.times do |sheep|
#     puts sheep
#   end
#   10
# end

# puts count_sheep
# the code will output 0-4 because of the times method invocation on line 56
# the code will also output 10 and a return value of nil

# e9

# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
# end

# p count_sheep
# the code will output 0, 1, 2 and 5
# the return keyword on line 72 exits the method after the third iteration once we reach the number 2
# the return value of the times method is 5 so this will also be output

# e10

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number
# the code will output 1. the method is truthy so the variable number will be initialized to equal 1
# the return value of a variable initialization is the value of the variable so 1 will be output and
# the return value of puts is nil
