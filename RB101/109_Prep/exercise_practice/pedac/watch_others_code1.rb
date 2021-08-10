=begin
https://medium.com/launch-school/why-you-need-an-interview-script-b86e18d0200a

Write a method that takes a string argument and returns a new string that contains the value
of the original string with all consecutive duplicate characters collapsed into a single
character.

Problem:
- string is given as an argument
- need to modify this string by taking out any consecutive duplicate characters

Q:
- what is a consecutive duplicate character? does "aaa" become "a"?
- what happens if that character occurs consecutively many times? "aabaa" becomes "aba"

Input: a string
Output: a new string with consecutive duplicate characters collapsed into a single character
Implicit / Explicit requirements:
- a new string must be returned
- any consecutive characters must be taken out
-- a character is consecutive if the character -1 index is the same
-- if a character occurs later in the string but is not consecutive it should not be taken out

Questions?
What should the return value be? A new object or mutate the argument?
What happens if the input is an empty string/hash/array?

Examples/Test Cases?
collapse("hello") == "helo"
collapse("aaaab") == "ab"
collapse("aaaabbaaaa") == "aba"

Algorithm
- initialize a new variable that points to an empty string
- iterate through the input string
-- put each character into the new string
-- if the character is the same as the preceeding character, don't put into new string
- return the new string

=end
# def collapse(str)
#   new_str = ""
#   array = str.chars

#   index = 0
#   loop do
#     if index == 0
#     new_str << array[index]
#     else
#       new_str << array[index] if array[index] != array[index-1]
#     end

#     index += 1
#     break if index == array.size

#   end

#   new_str
# end

# p collapse("hello") == "helo"
# p collapse("aaaab") == "ab"
# p collapse("aaaabbaaaa") == "aba"
# p collapse("wwooonndeerrfull woorrlldd") == "wonderful world"
# p collapse("B") == "B"
# p collapse("heLlo") == "heLlo"


# Problem 1: Repeated substring
=begin
Given a non-empty string, check if it can be constructed by taking a substring of it and appending
multiple copies of the substring together. You may assume the given string consists of lowercase
English letters only.

Problem:
- need to determine if a string has any substrings inside of it.
- how to determine what is a substring? >> hard part
- if a substring is repeated more than once, return true
- if the substring is never repeated or does not exist, return false

Input: a string
Output: boolean (true or false)
Implicit / Explicit requirements:
- string must not be empty
- string consists of lowercase letters only and no special characters or numbers
- a substring is any pattern of characters
- if the substring repeats, return true

Questions?
- what defines a substring?
--- substring is defined by a pattern of characters "ab"
- how many substrings can exist within a string?
- can a substring be just one letter or must be more than one?

Examples / test cases:
- 'abab'
>>> "ab", "ab", "abab"
- 'abaababaab'
>>> "ab"


Data Structure

Algorithm
- iterate through the string (convert to array for iteration)
- determine all substrings in the string
  - initialize a new empty array
  - loop through the array using a double loop
    - extract each substring by using a start and ending index that is reassigned on each iteration
    - increment the start index after each iteration of the inner loop
    - break when the start index == str.size
    # REPEATS HELPER METHOD
- if the substrings repeate themselves, return true. if not return false
--- helper method to determine if substrings repeat themselves
>>> substring must be more than one character long
>>> array must contain a substring more than once for a substring to repeat itself

Algorightm:
- take out all one character array elements
- return true if any substring occurs more than once in the array
--- sort the array
--- if arr[0] == arr[1] return true
>> this method doesnt work... how to find the repetitive array elements?

Example 1:
 - Input "abab"
 - Output: True
 - Explanation: It's the substring 'ab' twice.

Example 2:
 - Input: "aba"
 - Output: False
=end

# My solution...

# def repeated_substring(str)
#   arr = str.chars
#   array = []
#   # [ "a", "ab", "aba", "abab",
#   #   "b", "ba" "bab",
#   #   "a", "ab",
#   #   "b" ]

#   start_index = 0
#   end_index = 0
#   loop do
#     loop do
#       array << arr[start_index..end_index].join
#       end_index += 1
#       break if end_index == arr.size
#     end
#     start_index += 1
#     end_index = start_index
#     break if start_index == arr.size
#   end
#   repeats?(array, str)
# end

# def repeats?(arr, string)

#   arr.select! do |a|
#     a.size > 1
#   end

#   arr.sort!
#   # odd_string(string)

#   if arr[0] == arr[1] && (string.size.even? || odd_string(string))
#     return true
#   else
#     return false
#   end

# end

# def odd_string(str)
#   arr = str.chars
#   new_arr = []

#   iend = str.size - 1
#   index = 0

#   loop do
#     if str.size.odd?
#       new_arr << (arr[index] == arr[index+1])
#     end

#     index += 1
#     if index == (iend)
#       new_arr << (arr[-1] == arr[0])
#     end

#     break if index == iend
#   end

#   new_arr.delete(true)
#   return true if new_arr.empty?
# end

# Video solution:
# Algorith:
# - create an array of substrings that are up to half the length of the input string
# - for each substring, multiply it by the length of the string divided by length of the substring
# - if the multiplication is equal to the string, return true

# def repeated_substring(string)
#   substrings = []
#   1.upto(string.size/2).each do |num|
#     if (string.size % num == 0)
#       substrings << string[0, num]
#     end
#   end

#   substrings.each do |substring|
#     multiplier = string.size / substring.size
#     return true if substring * multiplier == string
#   end

#   false

# end

# p repeated_substring('abab') == true
# p repeated_substring('aba') == false
# p repeated_substring('aabaaba') == false
# p repeated_substring('abaababaab') == true
# p repeated_substring('abcabcabcabc') == true
# p repeated_substring('aaaaa') == true
# p repeated_substring('aa') == true



# PROBLEM 2

=begin
Given an array of strings made only from lowercase letters, return an array of
all characters that show up in all strings within the given array
(including duplicates). For example, if a character occurs 3 times in all
strings but not 4 times, you need to include that character three times in the
final answer.
=end

=begin
Problem:
- need to find which characters aree included in all strings in the array

Input: an array of strings
Output: and array of strings (each string represents a character that is in common)

Implicit / Explicit requirements:
- character must be included in all strings in the array
- if there is no character in common, return an empty array
- does the order of the output matter? assuming that first occurence is
the criteria

Algorithm
- initialize an empty array
- iterate through the input array
--- if the letter is present in each word, << into the new array
- return the new array

=end

def common_chars(array)
  chars = array.shift.chars

  chars.select do |char|
    array.all? { |word| word.sub!(char, "") }
  end
end

p common_chars(['bella', 'label', 'roller']) #== ['e', 'l', 'l']
# p common_chars(['cool', 'lock', 'cook']) #== ['c', 'o']
# p common_chars(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) #== []




  # index = 0

  # arr.each_with_index do |word, idx|
  #   word.chars.each do |letter|
  #     # p word.include?(letter)

  #   end
  #   # p word.include?(arr[idx][index])
  #   index += 1
  # end

  # arr_index = 0
  # current_word = arr[arr_index]
  # next_word = arr_index + 1
  # word_index = 0

  # loop do

  #   arr.each do |word|
  #     word.include?( )
  #   end

  #   arr[nex_word].include?(current_word[word_index])

  # index = 0
  # loop do
  #   word = arr[index]
  #   word.select do |letter|
  #     letter.all?()

  #   end
  # end

  # index = 0
  # current_word = arr[index]
  # word_index = current_word.size

  # loop do
  #   loop do
  #     if current_word.include?(current_word[index])
  #       result << current_word[index]
  #     end
  #     index += 1
  #     break if word_index == current_word.size
  #   end
  #   index += 1
  #   break if index == arr.size
  # end

  # arr.select do |word|
  #   word.chars.select do |letter|
  #     word.include?(letter)
  #   end
  # end

  # p result