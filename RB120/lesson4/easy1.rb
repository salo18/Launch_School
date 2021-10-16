# 1
# all are objects... invoke #class on each to see what class they belong to

# 2
# require 'pry'
# module Speed
#   def go_fast
#     binding.pry
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# spike = Car.new
# spike.go_fast

# trucky = Truck.new
# trucky.go_fast

# 3
# class method .... self.class

# 4
# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# AngryCat.new

# 5
# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# pizza = Pizza.new("cheese")
# orange    = Fruit.new("apple")

# p pizza.instance_variables
# p orange.instance_variables

# the Pizza class has an instance variable -- starts with @

# 6
# class Cube
#   attr_reader :volume
#   def initialize(volume)
#     @volume = volume
#   end
# end

# big_cube = Cube.new(5000)
# # p big_cube.instance_variable_get("@volume")
# p big_cube.volume

# 7
# What is the default return value of to_s when invoked on an object?
# >> the name of the object's class and its id
# Where could you go to find out if you want to be sure?
# ruby docs!

# 8
# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end
# # What does self refer to here?
# # self is calling the setter method for the age instance variable and reassiging it
# # to a new value
#   # >> the calling object

# kitty = Cat.new("black")
# p kitty.age
# kitty.make_one_year_older
# p kitty.age

# 9
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
# What does self refer to in this context?
# > class method so it refers to the class itself

# 10
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end

  def to_s
    puts "Hey I'm a #{self.class} and I am #{@color} #{@material}"
  end
end
bago = Bag.new("black", "leather")

bago.to_s