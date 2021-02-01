# Create a hash that expresses the frequency with which each letter occurs in
# this string:

statement = "The Flintstones Rock"

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

def freq(str)
  hash = {}
  counter = 0
  loop do
    letter = str[counter]
    number = str.delete(" ").chars.count(letter)
    hash[letter] = number
    counter += 1
    break if counter == str.size
  end
  p hash
end

freq(statement)


# LS answer
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end