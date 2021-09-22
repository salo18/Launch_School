# chapter 1:

# Q1: How do we create an object in Ruby? Give an example of the creation of an object.
# class Test
#   include Speak
# end

# testy = Test.new

# Q2: What is a module? What is its purpose? How do we use them with our classes? Create a module for the
# class you created in exercise 1 and include it properly.

# A module is a collection of behaviors that are useable in other classes via mixins.
# To use in a class, need to invoke the include method

# module Speak
# end

# class Test
#   include Speak
# end

# testy = Test.new



# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts "Arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")

# sparky.name

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     puts "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# sparky = GoodDog.new("Sparky", "4.9cm", "160lbs")
# sparky.info

# sparky.change_info("Spartacus", "4.9cm", "30lbs")
# sparky.info


# ch 2 exercises:

# class MyCar
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

#   attr_accessor :color

#   attr_reader :year

#   def speed_up(num)
#     @current_speed += num
#     puts "speeding up by #{num} mph!"
#   end

#   def brake(num)
#     @current_speed -= num
#     puts "braking now by #{num} mph!"
#   end

#   def turn_off
#     @current_speed = 0
#     puts "turning off..."
#   end

#   def current_speed
#     puts "You are currently going #{@current_speed} mph"
#   end

#   def spray_paint(col)
#     self.color = col
#   end
# end

# car = MyCar.new(2010, "Silver", "Rav4")

# # car.speed_up(50)
# # car.brake(20)
# # car.current_speed
# p car.year

# car.spray_paint("Turquoise")
# p car.color
