
=begin
Find the length of the longest substring in the given string that is the same in reverse.

Example:
longest_palindrome("I like racecars that go fast") == 7

If the length of the input string is 0, return value must be 0

Problem:
- need to find the length of the longest substring that is also a palindrome

Input: - a string
Output: - an integer representing the length of the longest palindrome substring
Implicit / Explicit requirements:
- palindrome is a word that is the same if reversed
- if input string length is 0, return value should be 0
- spaces do not count -- musst just be the words

Algorith:
- initialize a new array
- create all possible substrings for the string
- select all that can be a palindrome
- find the maximum by length
=end

def longest_palindrome(str)
  return 0 if str.empty?
  arr = str.chars
  substrings = []
  inner = 0
  outter = 0
  loop do
    loop do
      substrings << arr[inner..outter]
      outter += 1
      break if outter == arr.size
    end
    inner += 1
    outter = inner
    break if inner == arr.size
  end
  substrings.select {|sub_str| sub_str == sub_str.reverse}.max_by {|arr| arr.size}.size
end

p longest_palindrome('') == 0
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baab1kj12345432133d') == 9
p longest_palindrome("I like racecars that go fast") == 7

