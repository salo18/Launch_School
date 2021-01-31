# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# the return value is a new array [1, nil, nil] because the return value of puts
# is nil 