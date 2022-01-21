=begin
- need to convert a word to a scrabble score
- iterate through the string and get each letter's value from the hash
- sume the values and return

constructor - takes a string as an argument
value instance method that converts the string
=end


# class Scrabble
#   attr_accessor :str
#   def initialize(str)
#     @str = str
#     raise ArgumentError.new "must be a string" unless valid?
#   end

#   SCORES = {
#     ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
#     ["D", "G"] => 2,
#     ["B", "C", "M", "P"] => 3,
#     ["F", "H", "V", "W", "Y"] => 4,
#     ["K"] => 5,
#     ["J", "X"] => 8,
#     ["Q", "Z"] => 10
#   }

#   def valid?
#     str.to_s == str
#   end

#   def score
#     points = 0

#     str.chars.map(&:upcase).each do |char|
#       SCORES.each do |k, v|
#         points += v if k.include?(char)
#           # p "#{char} = key: #{k} value: #{v}"
#       end
#     end

#     points
#   end
# end

# s = Scrabble.new("cabbage")
# p s.score




class Scrabble
  attr_reader :str
  attr_accessor :points
  def initialize(str)
    @str = str
    @points = 0
    # raise ArgumentError.new "must be a string" unless valid?
  end

  SCORES = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"] => 2,
    ["B", "C", "M", "P"] => 3,
    ["F", "H", "V", "W", "Y"] => 4,
    ["K"] => 5,
    ["J", "X"] => 8,
    ["Q", "Z"] => 10
  }

  def valid?
    str.to_s == str
  end

  def score
    return 0 if str == nil

    str.chars.map(&:upcase).each do |char|
      SCORES.each do |k, v|
        self.points += v if k.include?(char)
      end
    end

    points
  end

  # def self.score(class_score)
  #   counter = 0
  #   return 0 if class_score == nil
  #   class_score.chars.map(&:upcase).each do |char|
  #     SCORES.each do |k, v|
  #       counter += v if k.include?(char)
  #     end
  #   end

  #   counter
  # end

  def self.score(word)
    Scrabble.new(word).score
  end
end

# s = Scrabble.new(nil)
# p s.score
p Scrabble.score("Asdf")




# proc is a way of encapsulating a block to pass around for later

# # How blocks work, and when we want to use them.
# def method(&a) # block to proc
#   a.call
#   yield if block_given?
# end

# method proc { puts "sup" } # block is still an implicit block and it is being executed by the yield keyword

# # explicit blocks are regulated by rules of methods - strict arity, must be passed in
# # implict blocks executed if there is a yield keyword but this has nothing to do with arity
# # implicit blocks are ignored without the yield keyword (and they are optional)
# #   - if there is a yield keyword and no implicit block, its a local jump error not an argument error (so not related to arity)





# def a_method(&block)
#   puts yield.class # String
#   puts block.class # Proc # ITS ONLY A PROC WHEN YOU CALL IT OTHERWISE ITS STILL THE ORIGINAL OBJECT
#   puts yield.class # String
#  end

#  this_is_a_proc = proc {'is this a proc?'}

#  a_method(&this_is_a_proc)

# When working with explicit blocks, the & converts the block to a simple Proc object that can then be referenced inside the method.
# Depending on the method implementation, the parameter is either a block or a proc object. It becomes a proc object when a proc method is invoked on it
# otherwise it will stay as whatever the block returns


# def a_method(a, &block) # to proc
#   puts a.call
#   block.call
# end

# this_is_a_proc = proc {'is thisoc?'}

# a_method(this_is_a_proc) {'is this a proc?'} #to block


# BINDING
# def sequence
#   counter = 0
#   Proc.new { counter += 1 }
# end

# s1 = sequence
# p s1.call           # => 1
# p s1.call           # => 2
# p s1.call           # => 3
# puts

# s2 = sequence
# p s2.call           # => 1
# p s1.call           # => 4 (note: this is s1)
# p s2.call           # => 2


# What is the return value of a block?
# >> the last evaluated expression -- like a method without borders
# >> dr
# What is the return value of a proc?
# the last evaluated expression


# binding will always go after the local variable first


# change = 123

# def change
#  456
# end

# def example
#  puts yield
# end



# example {change} # scope is anything above the method invocation not the method definition


# rvm - ruby version manager
# rake
# bundler - bundles the gems and manages dependencies

# USE RUBY 2.7

# methods and lambdas - strict arity
# blocks and procs - lenient arity
# rubocop file.rb -a  CHECK THIS

# turning in the file -- must have empty rubocop
