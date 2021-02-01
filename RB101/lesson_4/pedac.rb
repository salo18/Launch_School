# Imagine a sequence of consecutive even integers beginning with 2. The integers are
# grouped in rows, with the first row containing one integer, the second row two integers,
# the third row three integers, and so on. Given an integer representing the number of
# a particular row, return an integer representing the sum of all the integers in that row.

# P - Understanding the problem

# input - an integer representing the # of a row
# output - an integer -- the sum of all numbers in that row

# question... does each row begin with two or the next consecutive integer?

# Rules:
# explicit requirements -
  # the row number tells us how many integers in that row
  # each row consists of consecutive even integers starting at 2
# implicit requirements -


# E - Examples
  # input - 1
  # row 1 contains: [2]
  # output is 2

  # input 5
  # row 5 contains:
  # 2
  # 4, 6
  # 8, 10, 12
  # 14, 16, 18, 20
  # 22, 24, 26, 28, 30
  # output is 22+24+26+28+30 == 130

  # Pseudocode:
  # method "integer" takes in an integer and adds all the values of that "row"
    # submethod that creates that array
      # each "row" doesn't start at 2.. it starts at the next consecutive even integer
      # create array of arrays

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end


def create_row(start_integer, row_length)
  row = []
  loop do
    row << start_integer
    start_integer += 2
    break if row.length == row_length
  end
  row
end

p create_row(8, 3) == [8, 10, 12]

p sum_even_number_row(3) == 30

# [2]
# [4, 6]
# [8, 10, 12]
# [14, 16, 18, 20]

# D
# A
# C



# def even_arr(num)
#   even = []
#   counter = 0
#   arr_num = 2

#   loop do
#     even.push(arr_num)
#     arr_num += 2
#     counter += 1
#     break if counter == num
#   end
#   even
# end

# def integer(num)
#   array = even_arr(num)
#   array.sum
# end

# p integer(10)