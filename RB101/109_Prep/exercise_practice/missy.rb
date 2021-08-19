# =begin
# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.

# Problem:
# - want to return the longest substring based on alpahbetical order

# Input: a string
# Output: the longest substring
# Implicit / Explicit requirements:
# - substring ends when a early letter comes after a later letter -- index 20, index 5 would end the substring
# - some strings are valid substrings, some are not (if they follow the alphabetical rule)

# Questions?
# - what defines a substring?
# == substring is a string of characters (one or larger) inside a string

# Algorithm
# - make database with alphabet and corresponding position in the alphabet (hash) / array index
# - make an array containing all substrings
# - helper method
# --- determines which substring is valid or not based on the position in the alphabet
#     -- iterate through the array
#     -- for each substring,
#         -- for each character and its index,
#             -- get index of next character by adding one to current char
#             -- if index of next character is greater, it's valid, if it is smaller, not valid
#     -- put valid characters into a new array and return this new arrary
# - determining the longest of the valid substrings
# >> return the longest valid substring
# =end

# ALPHABET = []
#   ("a".."z").to_a.each do |letter|
#     ALPHABET << letter
#   end

# def longest(str)
#   substrings = []
#   start_index = 0
#   end_index = 0

#   loop do
#     loop do
#       substrings << str[start_index..end_index]
#       end_index += 1
#       break if end_index == str.size
#     end
#     end_index = start_index
#     start_index += 1
#     break if start_index == str.size
#   end

# longest_array(is_valid(substrings))
# end

# def is_valid(array)
#   array.select! do |string|
#     string.chars.sort == string.chars
#   end
#   array
# end

# def longest_array(new_array)

#   new_array.sort_by! do |el|
#     el.size
#   end

#   new_array[-1]
# end

# # def is_valid(array)
# #   arr = []
# #   index = 0
# #   currenty_index = 0
# #   char_index = 0
# #   until index == array.size
# #     array[index].chars.each_with_index do |letter, char_index|
# #       if ALPHABET.index(letter) > ALPHABET.index(array[char_index + 1])
# #     end
# #     # p index
# #     index += 1
# #   end
# #     # if array[0].index(0)
# #     #   ALPHABET.index()
# # end
#       # put letter as argument... if index is greater, continue
#     # arr <<


#   # array.each do |substring|
#   #   substring.chars.each do |letter|
#   #     if ALPHABET.index(letter) > ALPHABET.index(letter+1)
#   #       array << substring
#   #     end
#   #   end
#   # end

#   # arr

# # return an array of only the strings that are in alphabetical order
# # iterating through the strings in the array passed in
#   # iterating through the characters in the current string and keep track of the index while you do it
#     # if the current character is "greater than" the next character,
#     # how do you access the next character?
#       # something
#     # otherwise
#       # something else


# # p longest("asdfaaaabbbbcttavvfffffdf") #== "aaaabbbbctt"
# # p longest('asd') == 'as'
# # p longest('nab') #== 'ab'
# p longest('abcdeapbcdef') #== 'abcde'
# # p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# # p longest('asdfbyfgiklag') #=='fgikl'
# # p longest('z') == 'z'
# # p longest('zyba') == 'z'

# #max_by
# #sort_by
# #all?
# #any?

# def all_substrings(str) # => returns all substrings of given string
# def valid_substrings(all_substrings) # => returns all
#   -- valid?(substring)

#   valid_substrings.select { |substring| valid?(substring) }

# def longest(str)
#   all_substrs = all_substrings(str)
#   valid_substrs(all)
# end




# SECOND TRY
=begin
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

Problem:
- need to find the longest substring that is in alphabetical order

Input:
- a string
Output:
- the longest substring that is in alphabetical order
Implicit / Explicit requirements:
- a valid substring ends when alphabetical order is broken
- need to return the longest substring that occurs first in the sequence

Algorithm
- need to create an array with all letters in the alphabet (will reference using index)
- helper method: create an array of all substrings
  - double loop (iterate over start and end index to create all sub arrays)
- helper method: determine which substrings are in alphabetical order
  - pass in substrings array into `valid_substrings`
    - for each substring compare each substring to itself... if it is sorted in alphabetical
      order, it will be valid
- helper method: determine which is the longest substring that occurs first
  - create a hash with each valid substring... key is the number of occurances, value is the
  substrings that occur that number of times
  - extract the first array element of the last hash
=end

# ALPHABET = []
# ("a".."z").to_a.each do |letter|
#   ALPHABET << letter
# end

# def longest(string)
#   # substrings = create_substrings(string)
#   # valid = valid_substrings(substrings)
#   longest_substring(valid_substrings(create_substrings(string)))
# end

# def create_substrings(str) #create all substrings
#   all_substrings = []
#   start_index = 0
#   end_index = 0
#   loop do
#     loop do
#       all_substrings << str[start_index..end_index]
#       end_index += 1
#       break if end_index == str.size
#     end
#     end_index = start_index
#     start_index += 1
#     break if start_index == str.size
#   end
#   all_substrings
# end

# def valid_substrings(all_substrings)
#   all_substrings.select do |substring|
#     substring.chars.sort == substring.chars
#   end
# end

# def longest_substring(valid_substrings)
#   valid_substrings.sort_by! do |valid_substring_arr|
#     valid_substring_arr.size
#   end
#   substring_hash = {}

#   valid_substrings.each do |string|
#     if substring_hash[string.size] == nil
#       substring_hash[string.size] = [string]
#     else
#       substring_hash[string.size] << string
#     end
#   end

#  if valid_substrings.size == 1
#     result = valid_substrings.join
#  else
#   result = substring_hash[substring_hash.size - 1][0]
#   end

#   result
# end

# p longest("asdfaaaabbbbcttavvfffffdf") == "aaaabbbbctt"
# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') == 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') =='fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'




=begin
You will be given a collection of five cards (representing a player's hand in poker). If your hand contains at least one pair, return an array of two elements: true and the card number of the highest pair (trivial if there only exists a single pair). Else, return false.

Hands with three or more of the same card still count as containing a pair (see the last example).

Problem:
- need to return an array that contains `true` and the highest pair
- if no pairs in the hand, return false

Input: an array of strings representing a deck of cards
Output: an array containing (1. true and the value of the highest pair) or (2. false)

Implicit / Explicit requirements:
- Ace is the highest card and does not count as 2
- a pair is when a card is repeated at least once
  -- x2, x3, x4, x5
- if there are multiple pairs, need to determine which pair is highest
- order of the deck of cards... (2..10) + J, Q, K, A
- if there are no pairs, return false

Algorithm
- initialize an array that contains the order of the deck of cards
  - (2..10) + J, Q, K, A
- iterate through input array
  - determine if there is a pair -- Helper method?
    - a pair exists if a card is repeated at least once
  - get array from helper method
    - if there are multiple pairs, which one is highest?
      - compare the card to the indexes of the cards array (A is 21, Q is 19)
- return highest pair and true OR return false if helper method array is empty
  - assuming an array of pairs, return the max element
    -

Pair Helper method:
- iterate through the array
- sort the array so that array is in alphabetical order
- compare the element at index 1 to index 0
  arr[index] == arr[index + 1]
- if any of the elements return true, store them in a new array
- return the array containing any pairs or an empty array
=end
DECK = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  UPPERCASE = ("A".."Z").to_a


def highest_pair(hand_of_five)
  uppercase = ("A".."Z").to_a
  pairs = pair(hand_of_five)

  if pairs.empty?
    return false
  else
    return [true, card_max(pairs)]
  end
  # if pairs.size > 1
  #   if deck.index(pairs[0]) > deck.index(pairs[1])
  #     if uppercase.include?(pairs[0])
  #       return[true, pairs[0]]
  #     else
  #       return [true, pairs[0].to_i]
  #     end
  #   else
  #     if uppercase.include?(pairs[0])
  #       return[true, pairs[1]]
  #     else
  #       return [true, pairs[1].to_i]
  #     end
  #   end
  # elsif pairs.size == 1
  #   if uppercase.include?(pairs[0])
  #       return[true, pairs[0]]
  #     else
  #       return [true, pairs[0].to_i]
  #     end
  # else
  #   return false
  # end
end

# given an array of two cards, determine which is higher

def card_max(array)
  array.sort_by! do |card|
    DECK.index(card)
  end
  int_str?(array[-1])
end

def int_str?(highest_card)
  if UPPERCASE.include?(highest_card)
    return highest_card
  else
    return highest_card.to_i
  end
end

# p card_max(example_cards) # return a string or integer depending on card
# return a string if it's a face card
# return an integer if it's not

def pair(hand)
  pairs = []
  hand.sort!.each_with_index do |card, idx|
    if hand[idx] == hand[idx + 1]
      pairs << card
    end
  end
  pairs
end

p highest_pair(["A", "A", "Q", "Q", "6" ]) #== [true, "A"]
p highest_pair(["J", "6", "3", "10", "8"]) #== false
p highest_pair(["K", "7", "3", "9", "3"]) #== [true, 3]
p highest_pair(["K", "9", "10", "J", "Q"]) #== false
p highest_pair(["3", "5", "5", "5", "5"]) #== [true, 5]