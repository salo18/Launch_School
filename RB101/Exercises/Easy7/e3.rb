# Write a method that takes a single String argument and returns a new string that
# contains the original value of the argument with the first character of every word
# capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# def word_cap(str)
#   str.split
#   new_str = str.split.map do |word|
#               word.capitalize
#             end
#   new_str.join(' ')
# end
# this is correct

# LS answer:
# def word_cap(str)
#  str.split.map(&:capitalize).join(' ')
# end

# without #capitalize

# solution 1:

UPPER_CASE = ("A".."Z").to_a
LOWER_CASE = ("a".."z").to_a

def word_cap(str)
  new_str = str.split

  new_str.each do |word|
    counter = 0
    index = 0
    loop do
      if LOWER_CASE.include?(word[counter])
        index = LOWER_CASE.index(word[counter])
        break
      else
        counter += 1
        index = LOWER_CASE.index(word[counter])
      end
    end
    word[counter] = UPPER_CASE[index]
  end
  new_str.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap("this is a 'quoted' word") #== 'This Is A "quoted" Word'