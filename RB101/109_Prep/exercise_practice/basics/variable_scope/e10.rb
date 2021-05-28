a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a


# this is a method definition so the contents of the block have no effect on local
# variable `a`

# `a` remains 7