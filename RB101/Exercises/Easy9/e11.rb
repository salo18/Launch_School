# Given the array...

# Write a program that prints out groups of words that are anagrams. Anagrams are words
# that have the same exact letters in them but in a different order. Your output should
# look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

# could not solve this on my own... needed some help from LS

# PEDAC:
# initialize a new hash
# iterate through the array and sort each element in alphabetical order
# add each element to the hash as a key
# if the sorted element is repeated, add it as a value to the matching key
# output the values of each key

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def is_anagram(arr)
  result = {}
  arr.each do |word|
    key = word.split('').sort.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end
  result
end

def print_anagram(arr)
  is_anagram(arr).each_value do |v|
    puts "------"
    p v
  end
end

print_anagram(words)


