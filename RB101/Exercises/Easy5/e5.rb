# Given a string that consists of some words (all lowercased) and an assortment of
# non-alphabetic characters, write a method that returns that string with all of the
# non-alphabetic characters replaced by spaces. If one or more non-alphabetic
# characters occur in a row, you should only have one space in the result
# (the result should never have consecutive spaces).

def cleanup(str)
  letters = ("a".."z").to_a
  new_str = []
  str.chars.each do |let|
    if letters.include?(let)
      new_str << let
    else
      new_str << ' ' unless new_str.last == ' '
      # did not figure out this unless statement -- had to look at LS solution
    end
  end
  new_str.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
