# write a function named xor that takes two arguments, and returns true if exactly
# one of its arguments is truthy, false otherwise

# def xor?(arg1, arg2)
#   if arg1 == true || arg2 == true
#     return true
#   else
#     false
#   end
# end

# this solution was incorrect because it didn't take into account that only ONE can be true

# LS answer:
def xor?(arg1, arg2)
  return true if arg1 && !arg2
  return true if arg2 && !arg1
  false
end



puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false