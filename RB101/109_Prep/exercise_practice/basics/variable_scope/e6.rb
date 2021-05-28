
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# `a` remains 7.
# in the my_value method definition, local variable `b` is assigned to the value of
# twice the value of local variable `a`. the local variable `a` initialized on line 2
# is outside the scope of the method and is not accessible in the method definition.
# the code will output an error message because `b` is set to equal `a` but `a` is
# never defined in the method which causes an error on line 8 with the my_value method
# invocation
