# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# map returns a new array containing the results of the block
# this code will return ["bear"]

# WRONG... LS answer
# the method returns [nil, "bear"]. the nil comes from the first element of the hash
# being evaluated. "ant" is not greater than 3 so the if condition is false which
# gives a nil return value 