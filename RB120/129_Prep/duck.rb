# # Classes and Objects / # attr_method
class Person
  attr_reader :name
  def initialize(name)
    @name = name
    @color = "blue"
    @hair = "black"
  end

  def say_name
    puts "My name is #{@name}."
  end
end

bob = Person.new("Bob")
p bob.name
joe = "joe"
joe.name



def []

end


module Garden
  #   class Tools; end
  #   class Soil; end
  #   class Pots; end
  # end

  # module Garage
  #   class Wheels; end
  #   class Oils; end
  #   class Tools; end
  # end

  # Garage::Tools
  # Garden::Garden


# instance methods vs class methods


# instance variables vs class variables


# method access control


# referencing and setting getters and setters


# class inheritance


# encapsulation


# polymorphism


# modules / interface inheritance


# method lookup path


# super


# self

# fake operators and equality

# collaborator objects

# namespacing

# truthiness

# constants and lexical scope


# What is encapsulation?
# and provide an example

# state
# class Person
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end
# end

# bob = Person.new("Bob")
# p bob.name # Bob

# name = "Joe"
# name.name # no method error

# namespacing
# module Garden
#   class Tools; end
#   class Soil; end
#   class Pots; end
# end

# module Garage
#   class Wheels; end
#   class Oils; end
#   class Tools; end
# end

# Garage::Tools
# Garden::Garden

# method access control
# class Person
#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     name == other.name
#   end

#   # protected
#   # attr_reader :name

#   private
#   attr_reader :name

#   attr_writer :name
# end

# bob = Person.new("Bob")
# joe = Person.new("Joe")

# p bob == joe


# # What is polymorphism?

# # class inheritance
# class Person
#   def speak
#     puts "hi"
#   end
# end

# class Boy < Person
# end

# Boy.new.speak

# # interface inheritance
# module Speakable
#    def speak
#     puts "hi"
#   end
# end

# class Person
#   include Speakable
# end

# class Boy < Person
# end

# # duck typing
# class Dog
#   def speak
#     puts "woof"
#   end
# end

# class Guitar
#   def speak
#     puts "strum"
#   end
# end

# class Tire
#   def speak
#     puts "roll"
#   end
# end

# [Dog.new, Guitar.new, Tire.new].each { |obj| obj.speak }



# fake operators and equality

# collaborator objects

# namespacing

# truthiness

# constants and lexical scope
