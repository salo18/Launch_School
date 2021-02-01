alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0
# selected character is g

loop do
  current_character = alphabet[counter]

  if current_character == "g"
    selected_chars << current_character
  end

  counter += 1
  break if counter == alphabet.length

end

p selected_chars