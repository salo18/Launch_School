# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters,
# one the number of characters that are uppercase letters, and one the number of
# characters that are neither.

# def letter_case_count(str)
#   upper = ("A".."Z").to_a
#   lower = ("a".."z").to_a

#   u_arr = []
#   l_arr = []
#   neither = []

#   str.chars.each do |letter|
#     if upper.include?(letter)
#       u_arr << letter
#     elsif lower.include?(letter)
#       l_arr << letter
#     else
#       neither << letter
#     end
#   end

#   u_size = u_arr.size
#   l_size = l_arr.size
#   n_size = neither.size

#   hash = create_hash(u_size, l_size, n_size)
# end

# def create_hash(usize, lsize, nsize)
#   hash = {lowercase: lsize, uppercase: usize, neither: nsize}
# end

# THIS SOLUTION WORKS:

# LS SOLUTION:
UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_case_count(str)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  str.chars.each do |char|
    if UPPERCASE.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts
end

# p letter_case_count('abCdef 123')



p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }