# https://launchschool.com/lessons/85376b6d/assignments/2c1146ee

# Pedac:
# Problem
# Examples / test cases
# data structure
# algorithm
# code

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# Questions:
# - what is a palindrome? same word backwards and forwards
# - is a palindrom case sensitive? looks like it is
# - a word that is already uppercase should stay upperacased?
# - what should be returned? a new string or update the existing string

# input: a string
# output: a new string

# rules:
# Explicit requirements:
# identify which words are palindromes
# upper case those words
# palindromes are case sensitive
# implicit requirements:
# > the returned string should be a new obect
# > an empty string should return an empty string
# > if there are no palindromes, the original string should be returned unchanged

# Algorithm:
# initialize a new variable that points to an empty string
# loop through each word and determine if it is a palindrome
#   >>> create helper method for determining if a word is a palindrome
# << each word into `result` as iterating through and capitalize the word if
# it is a palindrome

# def change_me(str)
#   result = []
#   str.split.each do |word|
#     if is_palindrome?(word)
#       result << word.upcase
#     else
#       result << word
#     end
#   end
#   result.join(" ")
# end

# def is_palindrome?(str)
#   str == str.reverse
# end


# p change_me("We will meet at noon") == "We will meet at NOON"
# p change_me("No palindromes here") == "No palindromes here"
# p change_me("") == ""
# p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"






# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Questions:








# Problem:
# Suppose you have an arbitrary natural number (the target) and a set of one or more
# additional natural numbers (the factors). Write a program that computes the sum of
# all numbers from 1 up to the target number that are also multiples of one of the
# factors.
# For instance, if the target is 20, and the factors are 3 and 5, that gives us the
# list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.
# If no factors are given, use 3 and 5 as the default factors.

# Questions:
# > what is a natural number?
# > how many factor numbers will be given as parameters?
# >

# input: target number (number we need to reach) and factors (can be multiple?) 3 and 5 are defaults
# output: a number - the sum of the multiples

# Algorithm:
# > initialize an array
# > loop from 1 to target number
# >> if the current number is a multiple of a factor number, put into a new array
# >> add up all items inside the array
# > output the array

# def factors(target, factor1=3, factor2=5)
#   result = []
#   target_num = target

#   factor1 = 2
#   factor2 = 3
#   index = 1

#   while index < target
#     result << index if index % factor1 == 0 || index % factor2 == 0
#     index += 1
#   end
#   p result
#   p result.sum
# end

# factors(20, 3, 5)

# def factors(target, factors)
#   multiples = []

#   factors = [3, 5] if factors.size == 0

#   factors.each do |factor|
#     current_multiple = factor
#     while current_multiple < target
#       multiples << current_multiple
#       current_multiple += factor
#     end
#   end
#   multiples.uniq.sum
# end

# factors(20, [5])

# # tests:
# p factors(20, [3,5]) == 78
# p factors(20, [3]) == 63
# p factors(20, [5]) == 30
# p factors(20, []) == 78
# p factors(1, [0]) == 0
# p factors(20, [19]) == 19


def sum_of_multiples(target, factors)
  multiples = []
  factors = [3, 5] if factors.length == 0

  factors.each do |factor|
    current_multiple = factor

    while current_multiple < target
      multiples << current_multiple
      current_multiple += factor
    end
  end

  p multiples.uniq.inject(0, :+)
end

sum_of_multiples(20, [3, 5])  # returns 78
sum_of_multiples(20, [3])     # returns 63
sum_of_multiples(20, [5])     # returns 30
sum_of_multiples(20, [])      # returns 78
sum_of_multiples(1, [])       # returns 0
sum_of_multiples(20, [19])    # returns 19











# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.


# Problem:

# input: a positive integer (1 - 1000)
# output: the number of integers that are odd but not prime

# Requirements:
#   - prime number: number greater than 1 & has no divisor other than 1 and itself
#   - odd number: 1, 3, 5, .... (1 is not a prime number)
#   - determine which numbers are odd but not prime and return this value

# Algorithm:
# - find all the odd numbers
# - find which ones are prime
# - return this number


#   - initialize a variable that points to an empty array
#   - fill this array with all odd numbers (including prime numbers) from 1 to X
#     - iterate from 1 to x
#     - select from those the ones that are odd (#select)
#   - determine if a number is prime (helper method?)
#     - x % 1== 0
#     - iterate through every number from 1 to X
#     - if x % number == 0 for any number other than 1, the number is not prime
#     - for prime numbers, only x % 1 will be true
#   - if the number is prime, put it into a new array `result`
#   - the array will contain only odd numbers that are not prime. return the #size of the array


def odd_not_prime(num)
  arr = (1..num).to_a

  arr.select! do |n|
    n.odd?
  end

  result = []

  arr.each do |n|
    result << n if !is_prime?(n)
  end

  result.size
end


def is_prime?(num)
  arr = (1..num).to_a

  arr.select! do |n|
    num % n == 0
  end

  arr.size == 2
end


# p is_prime?(5)
# p is_prime?(10)
# p is_prime?(7)
# p is_prime?(20)


p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

def prime?(num)
  return false if num <= 1

  arr = (2...num).to_a

  arr.each do |n|
    return false if num % n == 0
  end

  true
end
