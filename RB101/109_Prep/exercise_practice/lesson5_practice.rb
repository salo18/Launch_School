# 1 - How would you order this array of number strings by descending numeric value?
# arr = ['10', '11', '9', '7', '8']

# arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end


# 2 - How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by do |hash|
#   hash[:published].to_i
# end


# 3 - For each of these collection objects demonstrate how you would reference the letter 'g'.
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# hsh1["b"][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# hsh2[:third].keys[0]

# 4 - For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

# arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4

# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] = 4

# 5 - figure out the total age of just the male members of the family.

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# PEDAC
# select for gender == male
# add up the numbers in the array

# male_age = 0

# munsters.each_value do |details|
#   male_age += details["age"] if details["gender"] == "male"
# end

# munsters.each do |k, v|
#   male_age += v["age"] if v["gender"] == "male"
# end

# 6 - print out the name, age and gender of each family member:
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |k, v|
#   puts "#{k} is a #{v["age"]} old #{v["gender"]}"
# end

# 7 - what would be the final values of a and b?
# a = 2
# b = [5, 8]
# arr = [a, b]
# # arr = [2, [5, 8]]

# arr[0] += 2
# # arr = [4, [5, 8]] --- this is reassignment and does not affect a
# arr[1][0] -= a
# # arr = [4, [3, 8]] because a is still 2

# 8 - Using the each method, write some code to output all of the vowels from the strings.
# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# vowels = ["a", "e", "i", "o", "u"]

# hsh.each do |k, v|
#   v.join.split("").each do |letter|
#     puts letter if vowels.include?(letter)
#   end
# end

# 9 - Given this data structure, return a new array of the same structure but with the sub arrays being
# ordered (alphabetically or numerically as appropriate) in descending order.

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# arr.map do |sub_arr|
#   sub_arr.sort do |a, b|
#     b <=> a
#   end
# end

# 10 - without modifying the original array, use the map method to return a new array identical
# in structure to the original but where the value of each integer is incremented by 1.
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# # my answer
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
#   hash.each do |k, v|
#     hash[k] += 1
#   end
# end

# # LS answer
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
#   increment = {}
#   hash.each do |k, v|
#     increment[k] = v + 1
#   end
#   increment
# end

# 11 - use #select to return a new array identical in structure to the original but containing
# only the integers that are multiples of 3
# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# arr.map do |a|
#   a.select do |num|
#   num % 3 == 0
#   end
# end

# 12 - Given the following data structure, and without using the Array#to_h method, write some
# code that will return a hash where the key is the first item in each sub array and the value
# is the second item.
# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# arr.map do |sub_arr|
#   hash = {}
#   sub_arr.each do |element|
#     p element
#   end
#   hash
# end

# hash = {}
# arr.each do |sub_arr|
#   hash[sub_arr[0]] = sub_arr[1]
# end

# 13 -  return a new array containing the same sub-arrays as the original but ordered logically
# by only taking into consideration the odd numbers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# expected output - [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num % 2 != 0
  end
end

# 14 - write some code to return an array containing the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# # [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# hsh.map do |_, v|
#   if v[:type] == "fruit"
#     v[:colors].map do |col|
#       col.capitalize
#     end
#   elsif v[:type] == "vegetable"
#     v[:size].upcase
#   end
# end

# 15 - Given this data structure write some code to return an array which contains only the hashes
# where all the integers are even.

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr.select do |hsh|
#   hsh.all? do |_, v|
#     v.all? do |num|
#       num.even?
#     end
#   end
# end

# 16 - Write a method that returns one UUID when called with no parameters.

# ALEPH = ('a'..'z').to_a + ('0'..'9').to_a

# def uuid
#   uuid = ""
#   sections = [8, 4, 4, 4, 12]

#   sections.each_with_index do |section, idx|
#     section.times do |num|
#       uuid += ALEPH.sample
#       end
#       uuid += "-" unless idx >= sections.size - 1

#   end
#   # first = ""
#   # second = ""
#   # third = ""
#   # fourth = ""
#   # fifth = ""
#   # ALEPH.sample

#   # # first
#   # 8.times do |num|
#   #   first << ALEPH.sample
#   # end

#   # #second
#   # 4.times do |num|
#   #   second << ALEPH.sample
#   # end

#   # #third
#   #  4.times do |num|
#   #   second << ALEPH.sample
#   # end

#   #  #fourth
#   #  4.times do |num|
#   #   second << ALEPH.sample
#   # end

#   #  #fifth
#   #  12.times do |num|
#   #   second << ALEPH.sample
#   # end

#   # "#{first} - #{second} - #{third} - #{fourth} - #{fifth}"
#   uuid
# end

# p uuid




# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end



# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     puts "index is #{index}"
#     puts "sections.size is #{sections.size}"
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end


# p generate_UUID

# MISSY PRACTICE PROBLEM
# p ([["...", "!!!", "!!"],
# ["select_me?", "please_select_me?", "how about_me?"],
# ["what does it mean to be a string?", 'true']].select do |array|
#   array.any? { |string| string.include?('?') }
#   # ["...", "!!!", "!!"]
#   # ["select_me?", "please_select_me?", "how about_me?"]
#   # ["what does it mean to be a string?", 'true']
# end)




# def fix(value)
#   value << 'xyz'
#   value.upcase
#   value.concat('!')
# end
# s = 'hello'
# t = fix(s)



# def fix(value)
#   value << 'xyz'
#   value = value.upcase
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)

# p s
# p t


# def add_name(arr, name)
#   arr = arr + [name]
# end

# names = ['bob', 'kim']
# puts add_name(names, 'jim')
# # puts names


# { a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
#   array << pair.last
# enda = 'Bob'

# 5.times do |x|
#   a = 'Bill'
# end

# p a

# def my_friends
#   puts "I like my friends"
# end


# p my_friends





