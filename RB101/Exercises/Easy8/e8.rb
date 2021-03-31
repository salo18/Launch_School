# Write a method that takes a string, and returns a new string in which every consonant
# character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not
# be doubled.

require 'pry'

NUM = (0..9).map {|n| n.to_s}

ALEPH = ['a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U', '-', ' ', '!'] + NUM

def double_consonants(str)
  new_str = ""
  str.chars.each do |letter|
    if ALEPH.include?(letter)
      new_str << letter
    else
      new_str << letter << letter
    end
  end
  p new_str
end

# CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

# def double_consonants(string)
#   result = ''
#   string.each_char do |char|
#     result << char
#     result << char if CONSONANTS.include?(char.downcase)
#   end
#   result
# end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""