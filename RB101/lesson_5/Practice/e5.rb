# Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age = 0
munsters.each_value do |hash|
  age += hash["age"] if hash["gender"] == "male"
end

p age


# def males(hash)
#   males = []
#   hash.values.map do |arr|
#     arr.select do |k, v|
#       if v == "male"
#         males << arr
#       end
#     end
#   end
#   males
# end

# def ages(arr)
#   age = []
#   arr.map do |hsh|
#     hsh.select do |k, v|
#       if k == "age"
#         age << v
#       end
#     end
#   end
#   age.sum
# end

# p males(munsters)

# males_method = males(munsters)

# p ages(males_method)