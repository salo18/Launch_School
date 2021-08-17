# 8/6/21
# # Given two strings, return the characters that are not common in the
# # two strings.

# # Algorithm:
# # initialize a variable that contains the characters that are not common
# # --- this variable should be returned at the end of the method
# # determine which characters are in common between the two strings
# # --- create an array


# def unique_string_characters(str1, str2)
#   final = ""
#   arr1 = str1.chars
#   arr2 = str2.chars
#   str1.each do |x|
#     p x.include?(arr2)
#   end
# end

# p unique_string_characters("xyab","xzca") == "ybzc"
# p unique_string_characters("a","z") == "az"
# p unique_string_characters("abcd","de") == "abce"
# p unique_string_characters("abc","abba") == "c"
# p unique_string_characters("xyz","zxy") == ""




# =begin
# Given two strings, return the characters that are not common in the two strings.

# # PROBLEM
# Input: 2 strings
# Output: string
# Questions:
# - what should we return?
# - lettercase
# - non-alphabetic characters?
# - number of occurrences of characters?

# # EXAMPLES
# p unique_string_characters("xyab","xzca") == "ybzc"
# p unique_string_characters("a","z") == "az"
# p unique_string_characters("abcd","de") == "abce"
# p unique_string_characters("abc","abba") == "c"
# p unique_string_characters("xyz","zxy") == ""

# Main Task:
# - remove characters that are in common, and return the ones that aren't

# Requirements:
# - order should be retained from the input strings - characters from first string would come first, then the characters from the second string
# - order isn't important in terms of input string
# - input strings can be of different lengths
# - number of occurrences is irrelevant in determining common characters
# - if all the characters are in common, return an empty string
# - only need to deal with lowercase alphabetic characters

# # DATA STRUCTURES
# Input: string
# Output: string
# - array?

# # ALGORITHM

# Justin:
# =begin
# def unique_string_characters(string1,string2)
#   initialize an empty array
#   loop
#     take first letter of string1
#     compare it to string2
#     if there is no match, put it in array
#     go to next character
#   end

# end


# Leo:
# 1.We want to define a method that takes two string parameters,
# 2. Check to see if any characters in the two string parameters match.
# 3. Return the value of the characters that do not match
# 4. Print the return value to the screen to make sure it works.
# Which method removes the the found characters from the strings?



# Roni:
#   **mental model:** take two strings and iterate over each character to find the uncommon characters between the two strings. Return a new string containing the uncommon characters.

# 1) Create an empty string called `new_array` that will contain the new string of uncommon characters
# 2) Create a method called `unique_string_characters`that takes in two strings as parameters.
# 3) In this method, compare the two parameters. For every character in the first string, determine if there is at least one idential character in the second string.
# 4) Save the uncommon characters in the `new_array` string.
# 5) Return the `new_array` string.


# Salo:
# # Algorithm:
# # initialize a variable that contains the characters that are not common
# # --- this variable should be returned at the end of the method
# # determine which characters are in common between the two strings
# # --- create an array



# - accept two strings (`str1` and `str2`) as arguments
# - create an empty array (`result`) for resulting characters

# - break down first string (`str1`) into individual characters
# - look at each character (`char`)
#   - if the character (`char`) is not included in the second string (`str2`)
#     - add it to the results array (`result`)
#   - otherwise
#     - move onto the next character

# - break down second string (`str2`) into individual characters
# - look at each character (`char`)
#   - if the character (`char`) is not included in the first string (`str1`)
#     - add it to the results array (`result`)
#   - otherwise
#     - move onto the next character

# - combine all characters in the results array (`result`) into a single string
# - return the final string


# https://app.coderpad.io/sandbox

# =end

# # CODE

# def unique_string_characters(str1,str2)
#   result = []
#   str1.chars.each do |char|
#     result << char unless str2.include?(char)
#   end

#   str2.chars.each do |char|
#     result << char unless str1.include?(char)
#   end

#   result.join
# end

# p unique_string_characters("xyab","xzca") == "ybzc"
# p unique_string_characters("a","z") == "az"
# p unique_string_characters("abcd","de") == "abce"
# p unique_string_characters("abc","abba") == "c"
# p unique_string_characters("xyz","zxy") == ""


# 8/13/21

=begin
# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm. Replace every letter in the string
# with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.


Problem:
- we need to modify the string according a certain rule (+ 3 in the alphabet)

Input: a string
Output: modified string (each letter +3 in the alphabet)
Implicit / Explicit requirements:
- each letter needs to be replanced by its corresponding value in the alphabet (+3)
- non letters shouldn't change ($ . @ 10)
- method is case sensitive

Algorithm
- initialize two arrays containing lower and upper case alphabets
- initialize an empty result array
- convert the string into an array
- iterate through the array
-- if array element is a letter, add array element + 3 index to new array
---- make sure to reference correct array depending on if array element is upper or lower case
-- if the array element is a character or number, put into array unchanged
--- if XYZ...
>>> return result array
=end

def letter_changes(str)
  lower_case_alphabet = ("a".."z").to_a
  ("a".."z").to_a.each do |letter|
    lower_case_alphabet << letter
  end

  upper_case_alphabet = []
  ("A".."Z").to_a.each do |letter|
    upper_case_alphabet << letter
  end

  result = str.chars.map do |el|
    edge_case = {"x" => 0 , y: 1, z: 2, X: 0, Y: 1, Z: 2}

    if edge_case[el.to_sym] != nil
      if el.downcase == el
        lower_case_alphabet[edge_case[el.to_sym]]
      else
         upper_case_alphabet[edge_case[el.to_sym]]
      end
    elsif lower_case_alphabet.include?(el)
      lower_case_alphabet[lower_case_alphabet.index(el) + 3]
     elsif upper_case_alphabet.include?(el)
      upper_case_alphabet[upper_case_alphabet.index(el) + 3]
     else
      el
    end
     # if lower_case_alphabet.include?(el)
     #  lower_case_alphabet[lower_case_alphabet.index(el) + 3]
     # elsif upper_case_alphabet.include?(el)
     #  upper_case_alphabet[upper_case_alphabet.index(el) + 3]
     # else
     #   el
     # end
  end
  result.join
end


p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
