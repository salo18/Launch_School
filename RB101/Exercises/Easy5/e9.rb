# Write a method that takes a string argument and returns a new string that contains
# the value of the original string with all consecutive duplicate characters collapsed
# into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(str)
  new_str = ""
  index = 0

  while str.length >= index
    new_str << str[index] unless str[index] == str[index + 1]
    index += 1
  end

  new_str
end

# my solution -- did not work
#   str.split.each do |word|
#     word.chars.each do |letter|
#       if word.include?(letter)
#         next
#       else
#         new_str << letter
#       end
#     end
#   end
#   new_str
# end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

