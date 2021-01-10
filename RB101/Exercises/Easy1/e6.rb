# Write a method that takes one argument, a string containing one or more words, and
# returns the given string with words that contain five or more characters reversed.
# Each string will consist of only letters and spaces. Spaces should be included only
# when more than one word is present.

# pseudo code
# get string and convert into an array
# if the length of array element is >=5, reverse the array element
# turn the new array into a string


def reverse_words(string)
  s = string.split.each do |word|
    if word.length >= 5
      word.reverse!
    else
      word
    end
  end
  s.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS