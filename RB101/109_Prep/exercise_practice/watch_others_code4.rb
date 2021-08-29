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

def substring_test(str1, str2)
  arr1 = str1.downcase.chars
  arr2 = str2.downcase.chars

  substring1 = create_sub(arr1)
  substring2 = create_sub(arr2)

  substring2.any? do |str|
    substring1.include?(str)
  end

end

def create_sub(arr)
  substring = []
  index = 0
  loop do
    arr.each_with_index do |_, idx|
      substring << arr[index..idx]
    end
    index += 1
    break if index == arr.size
  end
  substring.delete_if {|sub| sub.size <2 }
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', ' ') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'llt') == false
p substring_test(' ', ' ') == false
p substring_test('1234567', '541265') == true


=begin

index = 0
  loop do
    arr1.each_with_index do |_, idx|
      substring1 << arr1[index..idx]
    end
    index += 1
    break if index == arr1.size
  end
  substring1.delete_if {|sub| sub.size <2 }
  # substring1

  index = 0
  loop do
    arr2.each_with_index do |_, idx|
      substring2 << arr2[index..idx]
    end
    index += 1
    break if index == arr2.size
  end
  substring2.delete_if {|sub| sub.size <2 }


Write a function scramble(str1, str2) that returns true if a portion of
str1 characters can be rearranged to match str2, otherwise, return false.
=end

# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true

