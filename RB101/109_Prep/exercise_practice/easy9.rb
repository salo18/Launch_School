# # 1
# def greetings(arr, hash)
#   puts "Hello #{arr.join(" ")}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
# end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# # => Hello, John Q Doe! Nice to have a Master Plumber around.

# 2
# def twice(num)
#   if double_num(num)
#     num
#   else
#     num * 2
#   end
# end

# def double_num(num)
#   num_size = num.to_s.size
#   half = (num_size / 2) -1
#   if num_size.odd?
#     return false
#   elsif num_size.even? && num.to_s[0..half] == num.to_s[(half+1)..-1]
#       return true
#   elsif num_size.even? && num.to_s[0...half] != num.to_s[half..-1]
#       return false
#   end
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# 3
# def negative(num)
#   # if num > 0
#   #   -num
#   # elsif num < 0
#   #   num
#   # elsif num == 0
#   #   num
#   # end

#   num > 0 ? -num : num
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

# # 4
# def sequence(num)
#   # result = []
#   # 1.upto(num) do |n|
#   #   result << n
#   # end
#   # result
#   (1..num).to_a
# end
# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

# 5
# def uppercase?(str)
#   bool = str.chars.map do |char|
#     char.upcase == char
#   end
#   return false if bool.include?(false)
#   true
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# 6
# def word_lengths(str)
#   # hash = {}
#   # str.split.each do |word|
#   #   hash[word] = word.size
#   # end
#   # arr = []
#   # hash.each do |k, v|
#   #   arr << "#{k} #{v}"
#   # end
#   # arr

#   str.split.map do |word|
#     "#{word} #{word.size}"
#   end
# end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []

# 7
# def swap_name(name)
#   # arr = name.split
#   # fname = arr[0]
#   # lname = arr[1]
#   # p "#{lname}, #{fname}"

#   name.split.reverse.join(", ")
# end
# p swap_name('Joe Roberts') == 'Roberts, Joe'

# 8
# def sequence(count, first_num)
#   1.upto(count).to_a.map do |idx|
#     idx * first_num
#   end
# end

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# # 9
# def get_grade(num1, num2, num3)
#   # grades = {"A" => (90..100).to_a, "B" => (80...90).to_a, "C" => (70...80).to_a, "D" => (60...70).to_a}

#   # avg = (num1+num2+num3)/3

#   # grade_hash = grades.select do |k, v|
#   #   v.include?(avg)
#   # end

#   # grade_hash.to_a[0][0]

#   avg = (num1+num2+num3)/3
#   case avg
#   when 90..100 then "A"
#   when 80..89  then 'B'
#   when 70..79  then 'C'
#   when 60..69  then 'D'
#   else              'F'
#   end


# end

# p get_grade(95, 90, 93) #== "A"
# p get_grade(50, 50, 95) #== "D"

# 10
=begin
- input is a 2 dimensional array containing a fruit and the number of times
- need to print the fruit x number of times and create a new array

- iterate through the array and
=end
# def buy_fruit(arr)
#   result = []
#   arr.each do |fruit_arr|
#     1.upto(fruit_arr[1]) do
#       result << fruit_arr[0]
#     end
#   end
#   result

#  fruits =  arr.map do |fruit_q|
#     [fruit_q[0]] * fruit_q[1]
#   end

#   fruits.flatten

# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

# 11
=begin
HASH
- anagrams are words that have the same letters in a different order
> demo, mode, dome
- initialize an empty hash
- iterate through the arr
  - if the word is in the hash, add word as value
  - else add word as a key
- output hash values

ARRAY
- make an array containing all anagrams
- iterate over this new array
  - map to make a new array
    - select words for which the anagram == the word.chars.sort
=end

def anagram(arr)
  anagrams = arr.map {|word| word.chars.sort.join}.uniq

  array_of_ana = anagrams.map do |word|
    arr.select do |ana|
      word == ana.chars.sort.join
    end
  end

  array_of_ana.each {|ar| p ar}

  # result = {}

  # arr.each do |word|
  #   key = word.chars.sort.join
  #   if result.include?(key)
  #     result[key].push(word)
  #   else
  #     result[key] = [word]
  #   end
  # end
  # # result = {'demo'=> ["demo", "dome", "mode"], etc}
  # result.each do |_, v|
  #   p v
  # end




end
words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p anagram(words)

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)