=begin
Problem:
- determine if a list contains an anagram for X word

class Anagram
  - constructor that takes an argument "the word"
  # - which_is_anagram instance method that returns an anagram
  # if there is one
  - match instance method that determines which word is an
  anagram
=end

class Anagram
  attr_reader :str, :arr

  def initialize(str)
    @str = str
  end

  # def valid?
  #   return false if arr.empty?
  #   true
  # end

  def match(arr)
    anagram = arr.select do |word|
      word.downcase.chars.sort == str.downcase.chars.sort &&  word.downcase != str.downcase
    end
  end
end

a = Anagram.new('corn')
p a.match %w(corn dark Corn rank CORN cron park)

b = Anagram.new("Orchestra")
p b.match %w(cashregister Carthorse radishes)

# class Anagram
#   attr_reader :str, :arr

#   def initialize(str, arr)
#     @str = str
#     @arr = arr
#     raise ArgumentError.new "must include a word to compare" unless valid?

#   end

#   def valid?
#     return false if arr.empty?
#     true
#   end

#   def which_is_anagram
#     anagram = []

#     arr.each do |word|
#       anagram << word if word.chars.sort == str.chars.sort
#     end

#     anagram.join(", ")
#   end
# end

# # a = Anagram.new("listen", ["enlists", "google", "inlets", "banana"])
# a = Anagram.new("anna", [])

# # p a.which_is_anagram

