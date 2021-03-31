# Write a method that takes a non-empty string argument, and returns the middle character
# or characters of the argument. If the argument has an odd length, you should return
# exactly one character. If the argument has an even length, you should return exactly
# two characters.

# Examples:

def center_of(str)
  index = 0
  string = ""
  if str.size.odd?
    index = str.size / 2
    string << str[(index)]
  elsif str.size.even?
    index = str.size / 2
    string << str[(index-1)..index]
  end
  string
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'