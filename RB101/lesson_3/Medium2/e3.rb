# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# "My string looks like this now: pumpkins"
# += does not mutate the caller
# tricky_method(my_string) adds rutabaga to pumpkins but the new value is not saved
# because += does not mutate the caller

puts "My array looks like this now: #{my_array}"
# "My array looks like this now: ["pumpkins", "rutabaga"]"
# << is a method that mutates the caller so my_array is mutated after it passes through
# tricky_method


