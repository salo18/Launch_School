# Write a method that returns one uuid when called with no parameters.

# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def uuid
  alphabet = ("a".."f").to_a
  numbers = (1..9).to_a
  seed = alphabet.join + numbers.join
  seed1 = seed.chars
  a = 8.times {print seed1.sample}
  b = 4.times {print seed1.sample}
  c = 4.times {print seed1.sample}
  d = 4.times {print seed1.sample}
  e = 12.times {print seed1.sample}
  puts "#{a}" + "-" + "#{b}" + "-" + "#{c}" + "-" + "#{d}" + "-" + "#{e}"
end

uuid

# this solution is close bit returns
# x4g3j5fuqh1b8zgzvshdymkelf9ztw1w"8-4-4-4-12"

# need to figure out why my