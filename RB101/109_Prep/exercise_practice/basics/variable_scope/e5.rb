a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

# `a` remains "Xyzzy". Variables initialized inside a method definition are
# not accessible outside the method. 