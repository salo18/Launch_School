# print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}



munsters.each do |name, details|
  puts "#{name} is #{details['age']} years old and a #{details['gender']}"
end

# could not figure out the answer so had to look at LS solution


# def name(hash)
#   hash.each_key do |key|
#     puts key
#   end
# end

# (Name) is a (age)-year-old (male or female).


# def identify(hash)
#   age = ""

#   gender = ""

#   hash.each_value |sup|
#     age << sup["age"]
#     gender << sup["gender"]
#   end

#   puts "name is #{age} years old and a #{gender}"

# end


# identify(munsters)

# name =


# age =

# gender =


# puts "#{} is a #{}-year-old #{}"


