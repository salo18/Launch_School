# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards as it
# does backwards. The return value should be arranged in the same sequence as the
# substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention
# to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
# In addition, assume that single characters are not palindromes.

require 'pry'

ALEPH = ('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a


def remove_nonalpha(str)
  real_str = ""
  str.chars.each do |letter|
    real_str << letter if ALEPH.include?(letter)
  end
  real_str
end

def leading_substrings(str)
  new_arr = []
  aggregate = ""
  remove_nonalpha(str).chars.each do |letter|
    aggregate += letter
    new_arr.push(aggregate)
  end
  new_arr
  # this method prints all the characters in str from index 0 to str.size
end

def substrings(str)
  counter = str.size
  index = 0
  new_new_new = []
  loop do
    new_str = str[index..counter]
    new_new_new << leading_substrings(new_str)
    index += 1
    break if index == counter
  end
  new_new_new
  # this method takes out the leading character in str and then runs through
  # leading_substrings method
end

def is_palindrome?(str)
  str == str.reverse && str.size > 1
end

def palindromes(str)
   final = []
   substrings(str).each do |arr|
    arr.each do |phrase|
      final<< phrase if is_palindrome?(phrase)
    end
  end
  p final
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]