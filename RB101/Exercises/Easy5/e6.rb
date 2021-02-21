# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# def word_sizes(str)
#   hash = {}
#   str.split.each do |word|
#     hash[word.size] += 1
#   end
#   hash
# end

# this solution doesn't work... can't initialize hash = {}
# need to initialize hash as:
# hash = Hash.new(0)


def word_sizes(str)
  hash = Hash.new(0)
  str.split.each do |word|
    hash[word.size] += 1
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}