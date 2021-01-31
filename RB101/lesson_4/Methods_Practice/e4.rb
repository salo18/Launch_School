# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# going to return a hash
# hash[value[0]] = value is using a [] method to assign each key a value based on
# its index position
# {ant: 0, bear: 1, cat: 2}

# WRONG....
# the return value is {"a"=>"ant", "b"=>"bear", "c"=>"cat"}

# I assumed value[0] was relating to the index value but it was referencing
# the first letter of the word
# so it became hash[a] = value which uses the hash[key] = value method to
# assign the correct key value pair to the new returned hash 

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

names = flintstones.each_with_object({}) do |arr_items, hash|
  hash[arr_items] = flintstones.index(arr_items)
end
puts names

