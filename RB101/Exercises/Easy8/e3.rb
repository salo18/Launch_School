# Write a method that returns a list of all substrings of a string that start at the
# beginning of the original string. The return value should be arranged in order from
# shortest to longest substring.

# input - string
# output - array of substring elements in order from smallest to largest

# my answer -- this works
def leading_substrings(str)
  new_arr = []
  aggregate = ""
  str.chars.each do |letter|
    aggregate += letter
    new_arr.push(aggregate)
  end
  p new_arr
end


# LS answer:
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  p result
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
