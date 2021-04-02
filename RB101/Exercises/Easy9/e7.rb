# Write a method that takes a first name, a space, and a last name passed as a single
# String argument, and returns a string that contains the last name, a comma, a space,
# and the first name.

def swap_name(str)
  new_str = str.split(' ')
  fname = new_str[0]
  lname = new_str[1]

  "#{lname}, #{fname}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
