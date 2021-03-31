# Write a method that takes a string, and returns a new string in which every character
# is doubled.

def repeater(str)
  new_arr = []
  str.chars.each do |letter|
    new_arr << letter + letter
  end
  p new_arr.join()
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''