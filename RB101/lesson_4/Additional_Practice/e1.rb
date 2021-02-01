flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

hash = {}

flintstones.each_with_index do | element, index |
  hash[element] = index
end

p hash

