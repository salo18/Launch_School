# 1
# class Banner

#   def initialize(message, width = message.size + 2)
#     @message = message
#     @width = width
#   end

#   def to_s
#     if @width >= @message.size
#       [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#     else
#       "Your message is too long, try again"
#     end
#   end


#   private

#   def horizontal_rule
#     "+-#{"-" * @message.size}-+"
#   end

#   def empty_line
#     "| #{" " * @message.size} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end


# banner = Banner.new('To boldly go where no one has gone before.', 10)
# puts banner
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+


# banner = Banner.new('')
# puts banner
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

# 2
# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# # name = 'Fluffy'
# # fluffy = Pet.new(name)
# # puts fluffy.name
# # # Fluffy

# # puts fluffy
# # # My name is FLUFFY

# # puts fluffy.name
# # # FLUFFY

# # puts name
# # # FLUFFY


# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# 3
# class Book
#   attr_reader :author, :title
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{@title}", by #{@author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# # The author of "Snow Crash" is Neil Stephenson.
# # book = "Snow Crash", by Neil Stephenson.

# 4
# class Book
#   attr_accessor :title, :author
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# 5
# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def first_name=(name)
#     @first_name = name.capitalize
#   end

#   def last_name=(name)
#     @last_name = name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# 6
# class Flight
#   attr_accessor :flight_number

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# 7
# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

# 8
# class Rectangle
#   attr_accessor :height, :width

#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(length)
#     super(length, length)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# 9
# class Pet
#   attr_reader :name, :age
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   attr_reader :fur
#   def initialize(name, age, fur)
#     super(name, age)
#     @fur = fur
#   end

#   def to_s
#     "My cat #{name} is #{age} years old and has #{fur} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# 10

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end