# Study the following code and state what will be displayed...and why:

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# "My string looks like this now: 'pumpkinsrutabaga'"
# same reason as exercise 3... << mutates the caller so rutabaga is saved into the
# my_string variable

puts "My array looks like this now: #{my_array}"
# "My array looks like this now: #["pumpkins"]"
# variable reassignment so an_array_param and my_array no longer have the same value