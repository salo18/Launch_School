# Write a method that takes a positive integer, n, as an argument, and displays a
# right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left of
# the triangle, and the other end at the upper-right.

# PEDAC
# input - number
# output - triangle shape

# process:
# print out x - 1 number of spaces
# print out 1 star


def triangle(num)
  index = 1

  loop do
    spaces = num - index
    stars = index
    puts " "*spaces + "*"*stars
    break if index == num
    index += 1
  end
end

def right_triangle(num)
  index = 1

  loop do
    stars = num - index
    spaces = index
    puts "*"*spaces + " "*stars
    break if index == num
    index += 1
  end
end

right_triangle(5)

#     *
#    **
#   ***
#  ****
# *****


triangle(12)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
