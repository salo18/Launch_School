=begin
Given 2 strings, your job is to find out if there is a substring that
appears in both strings. You will return true if you find a substring
that appears in both strings, and false if not. A substring is longer
than 1 character.

Problem:
- need to find substring that is shared by two strings
Input: two strings
Output: boolean - true if strings share a substring
Implicit / Explicit requirements:
- strings don't have any spaces
- two strings with just spaces don't count
- a substring is two or more characters long
  - a single character would not count
- case insensitive - BANANA == banana

Algorithm
- need to create an array of substrings for each string
- need to delete all substrings that are length of one to remove
  single characters
- need to iterate through second substring comparing all of first
 substrings to any of second substrings
  - if any of them match, return true
=end

# def substring_test(str1, str2)
#   arr1 = str1.downcase.chars
#   arr2 = str2.downcase.chars

#   substring1 = create_sub(arr1)
#   substring2 = create_sub(arr2)

#   substring2.any? do |str|
#     substring1.include?(str)
#   end

# end

# def create_sub(arr)
#   substring = []
#   index = 0
#   loop do
#     arr.each_with_index do |_, idx|
#       substring << arr[index..idx]
#     end
#     index += 1
#     break if index == arr.size
#   end
#   substring.delete_if {|sub| sub.size <2 }
# end

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', ' ') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', 'llt') == false
# p substring_test(' ', ' ') == false
# p substring_test('1234567', '541265') == true


=begin
Write a function scramble(str1, str2) that returns true if a portion of
str1 characters can be rearranged to match str2, otherwise, return false.

Problem:
- need to compare substrings from str1 and see if they match all of str2

Input: two strings
Output: true or false, true if substrings from str1 can be rearranged to
        match str2
Implicit / Explicit requirements:
- str2 remains the same
- str1 substrings (in any order) must match str2
- case doesn't matter
- don't have to worry about spaces

Algorithm
- initialize an array of both strings
- compare the index 0 of str1 to see if it is included in str2 array
- sort str2 array so that letters are in alphabetical order so they
  can be shifted out of arr2 as needed
- if it is, shift that character out of str2 to avoid duplicate letters
- if arr2 is empty by the end of the iteration, return true

? or rebuild a new string with characters from arr2 -- if they match
str2.sort then return true?
=end

def scramble(str1, str2)
  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  index = 0
  loop do
    # p arr1[index]
    arr2.shift if arr2.include?(arr1[index])
    index += 1
    break if index == arr1.size
    # p arr2
  end

  arr2.empty? ? true : false


  # # LS solution
  # str2.each_char do |char|
  #   return false if str2.count(char) > str1.count(char)
  # end
  # true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

