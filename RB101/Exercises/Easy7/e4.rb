# Write a method that takes a string as an argument and returns a new string in which
# every uppercase letter is replaced by its lowercase version, and every lowercase
# letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

UPPER_CASE = ("A".."Z").to_a
LOWER_CASE = ("a".."z").to_a

def swapcase(str)
  new_str = []
  str.chars.map do |letter|
    if UPPER_CASE.include?(letter)
      new_str << letter.downcase!
    elsif LOWER_CASE.include?(letter)
      new_str << letter.upcase!
    else
      new_str << letter
    end
  end
  new_str.join('')
end


p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
