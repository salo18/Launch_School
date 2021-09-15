# # Next Featured Number Higher than a Given Value
# # https://launchschool.com/exercises/a1afc619
# =begin
# Problem:
# need to find the next featured number in a sequence

# Requirements:
# - number must be:
# -- multiple of 7
# -- odd
# -- digits only appear once
# - input number is the start number...
#   - need to count up

# Input: integer
# Output: integer that represents the next featured number

# Algorithm:
# - count up from start num by 1
# - return true if
#   - multiple of 7 && odd
#   - && digits only appear once

# digits_once helper method:
# - check if digits are unique
#   - put digits in an array of strings
#   - if the array.uniq == array, then the digits are unique

# =end

# def featured(num)

#   loop do
#     num += 1
#     break if num % 7 == 0 && num.odd? && helper(num)
#   end
#   num
# end

# def helper(num)
#   num.to_s.chars.uniq == num.to_s.chars
# end


# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# # featured(9_999_999_999)


# Sum Square - Square Sum
# https://launchschool.com/exercises/ce453287
# def sum_square_difference(num)
#   sum = (1.upto(num).to_a.sum)**2

#   squares = 1.upto(num).to_a.map{|n| n**2}.sum

#   sum - squares
# end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150


# Longest Sentence:

=begin
PEDAC:
requirements:
  - need to find the length in words of the longest sentence
  - a sentence begins with an upper case letter
  - a sentence ends with a . ! or ?
  - special characters in the sentence like "--" count as a word
input: a paragraph of sentences
output: the longest sentence and the amount of words in the sentence
algorithm:
  - sentence begins with an uppercase letter and ends with a special character
  - need to convert input sentence into an array of words
  - if a word starts with an uppercase letter, that is the start of a sentence
  - put all words into a hash key and stop if the word ends with a special character
  - how to create a new hash key when loop needs to restart ???

=end

def longest_sentence(str)
  arr = []

  str.split(/\.|\?|!/).each do |sent|
    arr << [sent]
  end
  arr.max {|w| w.size}.to_s.split.size
end


p longest_sentence("But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.")