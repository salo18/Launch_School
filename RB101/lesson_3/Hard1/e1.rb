# What do you expect to happen when the greeting variable is referenced in the last
# line of the code below?


if false
  greeting = "hello world"
end

greeting

# i expect nothing to happen... greeting is assigned when false but greeting
# is truthy by itself... so nothing is assigned to it

# LS answer: greeting is nil -- undefined method or variable exception is thrown 

