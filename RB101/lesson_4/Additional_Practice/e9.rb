# write a method that turns:

words = "the flintstones rock"

# to

# words = "The Flintstones Rock"


def capitalize(str)
  counter = 0
  new_str = str.split(" ")
  loop do
    current_word = new_str[counter]
    current_word[0] = current_word[0].upcase
    counter += 1
    break if counter == new_str.size
  end
  p new_str.join(" ")
end

capitalize(words)

# this solution is correct but not as succint as LS's answer:

# LS answer:
words.split.map { |word| word.capitalize }.join(' ')

