# class Animal
#   def hi
#     puts "hey #{@name}"
#   end
# end

# class Dog < Animal
#   attr_reader :name
#   # def initialize
#   #   @name = "Dog"
#   # end

#   def bark
#     @name = "Dog"
#     # puts @name
#   end
# end

# class Lab < Dog

# end

# animal = Animal.new
# # p animal
# # animal.hi
# # animal.bark

# dog = Dog.new
# p dog
# dog.bark
# p dog

# lab = Lab.new
# p lab
# lab.bark
# p lab

# # Ginni reply:
# class Person
#   def intialize
#   end

#   def say_something
#     @speech = "Cognito Ero Sum"
#     puts @speech
#   end
# end

# class Child < Person
# end

# jr = Child.new
# p jr                    # <Child:0x000055604e8ce228>
# # note that there is no instance variable

# jr.say_something        # Cognito Ergo Sum
# p jr                    # #<Child:0x000055604e8ce228 @speech="Cognito Ero Sum">
# # now jr has an instance variable


# #
# class Person
#   def intialize
#   end

#   def say_something
#     @speech = "Cognito Ero Sum"
#     puts @speech
#   end
# end

# class Child < Person
#   def say_something
#     puts "goo goo gaa gaa"
#   end
# end

# jr = Child.new
# p jr                    # <Child:0x000055604e8ce228>
# # note that there is no instance variable

# jr.say_something        # goo goo gaa gaa
# p jr                    # #<Child:0x000055604e8ce228>
# # still no instance variable


require 'pry'

module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    # binding.pry

    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape
