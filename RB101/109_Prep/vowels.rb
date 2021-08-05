# write a method that takes an array of strings and returns an array of the same
# string values except with the vowels removed

# input: green, yellow, black, white
# output: grn, yllw, blck, wht

require 'pry'

VOWELS = ["a", "e", "i", "o", "u"]

def vowels(arr)
  trash = []
  new_word = []
  new_arr = []

  arr.map do |word|
    chars = word.chars
    VOWELS.each {|letter| chars.delete(letter)}
    chars.join('')
  end
end

p vowels(["green", "yellow", "black", "white"])

#
# arr.each do |word|
#   word.chars.each do |letter|
#     if VOWELS.include?(letter)
#       trash << letter
#     else
#       new_word << letter
#     end
#   end
# end