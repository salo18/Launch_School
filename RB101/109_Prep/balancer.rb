# Write a method that takes a string and returns a boolean indicating whether this
# string has a balanced set of parentheses.

def balancer(str)
  # LS answer
  return false unless str.count("(") == str.count(")")

  paren_count = 0
  str.split("").each do |char|
    paren_count += 1 if char == "("
    paren_count -= 1 if char == ")"

    return false if paren_count < 0
  end
  true

 # my answer:
  # if str.start_with?("(") && str.end_with?(")")
  #   return true
  # elsif (str.start_with?("(") && str.end_with?("")) ||
  #       (str.start_with?("") && str.end_with?(")"))
  #   return false
  # elsif (str.start_with?(")") && str.end_with?("("))
  #   return false
  # elsif str.start_with?("") && str.end_with?("")
  #   return true
  # end
end

p balancer("hi") #== true
p balancer("(hi") #== false
p balancer("(hi)") #== true
p balancer(")hi(") #== false

