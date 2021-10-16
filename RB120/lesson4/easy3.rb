# 1
# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# hello = Hello.new
# hello.hi
# # "Hello"

# hello = Hello.new
# # hello.bye
# # unknown method

# hello = Hello.new
# # hello.greet
# # error - wrong number of arguments -- hello has access but nothing is passed in as an argument so nil is returned

# hello = Hello.new
# hello.greet("Goodbye")
# # "Goodbye"

# Hello.hi
# # unknown method -- hi is an instance method, not a class method

# # 2
# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def self.hi
#     greeting = Greeting.new
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.hi

# 3
# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# cat1 = AngryCat.new(22, "puffy")
# cat2 = AngryCat.new(1, "blue")

# cat1.age
# cat2.name

# 4
# class Cat
#   attr_accessor :type
#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     puts "I am a #{self.class} and I am #{type}"
#   end
# end

# kitty = Cat.new("black")
# p kitty.to_s
# kitty.type = "blue"
# p kitty.to_s

# # 5
# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer
# # error --- class method can't be called on an instance of the class
# tv.model
# # this would work

# Television.manufacturer
# # this would work
# Television.model
# # error - instance method can't be called on a class

# 6
# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# kit = Cat.new("black")
# kit.make_one_year_older
# p kit.age

# 7
class Light
  attr_accessor :brightness, :color  #this is not used at all

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
  # return is also repetitive... ruby automatically returns the last line of the method
end