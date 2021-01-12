# Describe the difference between ! and ? in Ruby. And explain what would happen
#  in the following scenarios:

# ! is the bang symbol. it can be appended to a method to make it mutate the caller
# ! can also be prepended in front of something to mean "not this"
# --- it turns anything other than nil and false into false

# ? can be a ternary operator
# ? can be appended to a method but it is just syntax and doesn't tell us what it does

# what is != and where should you use it?
# --- this means "does not equal"
# --- can be used in an if statement or data validation
# --- if user_input != "bad word" then...

# put ! before something, like !user_name
# this means "not user_name"

# put ! after something, like words.uniq!
# ! makes uniq mutate the caller

# put ? before something
# ? is the ternary operator

# put ? after something
# just syntax for a method name

# put !! before something, like !!user_name
# this turns user_name into its boolean equivalent which is true in this scenario