# 1
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# oracle = Oracle.new
# p oracle.predict_the_future
# # You will ...

# 2
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

# trip = RoadTrip.new
# p trip.predict_the_future
# # You will + choices from the RoadTrip class

# # 3
# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end
# # How do you find where Ruby will look for a method when that method is called?
# # > method lookup chain
# # How can you find an object's ancestors?
# # ancestors method

# orange = Orange.new
# # p orange.flavor("sweet")
# p Orange.ancestors

# 4
# class BeesWax
#   attr_accessor :type
#   def initialize(type)
#     @type = type
#   end

#   # def type
#   #   @type
#   # end

#   # def type=(t)
#   #   @type = t
#   # end

#   def describe_type
#     puts "I am #{type} Bees Wax"
#   end
# end

# bee = BeesWax.new("manuka")
# bee.describe_type

# 5
# excited_dog = "excited dog" # local variable
# @excited_dog = "excited dog" # instance variable
# @@excited_dog = "excited dog" # class variable

# # 6
# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end
# # self.manufacturer is a class method
# # can call a class method on the class name... Television.manufacturer

# 7
# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end
# @@cats_count is a class variable... it does not pertain to an individual object
# but rather the entire class. every time a new Cats object is instantiated,
# @@cats_count will be reassigned (incremented by 1). we can view the value stored
# in @@cats_count by calling the class method Cat#cats_count

# 8
# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end

# 9
# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end
# if we add another #play method to Bingo, that method will be executed if
# we call the play instance method on a Bingo object.
# overriding a method is another form of polymorphism without having to use a mixin??

# 10
# What are the benefits of using Object Oriented Programming in Ruby?
# - build out larger programs in a more organized way
# - isolate errors so that they can't affect the entire code -- encapsulation
# - make the code more flexible through polymorphism - multiple different types
#   of objects can respond to the same behaviors (methods)
# - allows you to reuse code easily -- don't have to duplicate code
# - more easily manage complexity of a larger program 

