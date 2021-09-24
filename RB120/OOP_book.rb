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

# Ch2 examples
# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
#   puts self
# end

# GoodDog
# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

# ////
# class GoodDog
#   DOG_YEARS = 7
#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.age

# ///
# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end

#   def what_is_self
#     self
#   end
# end

# sparky = GoodDog.new("Sparky", "14 feet", "160 lbs")
# p sparky.what_is_self

# fido = GoodDog.new("Fido", "14 feet", "160 lbs")
# p fido.what_is_self

# CH2 exercises
# class MyCar
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

#   attr_accessor :year, :color, :model

#   # attr_reader :year

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

#   def self.milage(milage, gallons)
#     puts "#{milage / gallons} miles per gallon"
#   end

#   def to_s
#     puts "The moodel is #{model}, it is #{color} and #{year} years old"
#   end
# end

# car = MyCar.new(2010, "Silver", "Rav4")
# # MyCar.milage(30, 2)
# puts car


# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"

# need to give an attr_accessor to name... it was set to reader which only gives a getter method
# since we are trying to change it, need a setter method


# CH 3 exercises:
# class Vehicle
#   @@number_of_vehicles = 0

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end

#   attr_accessor :year, :color, :model

#   # attr_reader :year

#   def self.how_many_objects
#     puts "This program has created #{@@number_of_vehicles} vehicles"
#   end

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

#   def self.milage(milage, gallons)
#     puts "#{milage / gallons} miles per gallon"
#   end

#   def age
#     puts "Your #{self.model} is #{years_old} years old"
#   end

#   private
#   def years_old
#     Time.now.year - self.year
#   end

# end

# module Rev
#   def rev_engine
#     puts "zzzzzz"
#   end
# end

# class MyTruck < Vehicle
#   include Rev

#   NUMBER_OF_DOORS = 2
#   def to_s
#     puts "My truck is a #{color} #{model} from #{year}"
#   end


# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4
#   def to_s
#     puts "My car is a #{color} #{model} from #{year}"
#   end
# end

# car = MyCar.new(2010, "Silver", "Rav4")
# # MyCar.milage(30, 2)
# # puts car
# truck = MyTruck.new(2000, "Gray", "Dodge")

# class Student

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   protected

#   def grade
#     @grade
#   end



# end

# joe = Student.new("Joe", 95)
# bob = Student.new("Bob", 90)

# puts "Well done!" if joe.better_grade_than?(bob)


# puts Vehicle.how_many_objects

# puts truck.rev_engine

# puts MyTruck.ancestors
# puts "----"
# puts MyCar.ancestors
# puts "----"
# puts Vehicle.ancestors

# car.age
# truck.age


class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
p daisy.speak