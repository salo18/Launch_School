# 1

# class Cat
#   def self.generic_greeting
#     p "Hello I'm a cat!"
#   end
# end

# Cat.generic_greeting

# kitty = Cat.new
# p kitty.class


# 2
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

# 3
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify

# 4
# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts "I'm a #{self}"
#   end

#   def personal_greeting
#     puts "I'm a #{name}"
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

# # 5
# class Cat
#   @@number_of_cats = 0

#   def initialize
#     @@number_of_cats += 1
#   end

#   def self.total
#     p @@number_of_cats
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

# 6
# class Cat
#   attr_accessor :name
#   COLOR = "blue"

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end

# end

# kitty = Cat.new('Sophie')
# kitty.greet
# # Hello! My name is Sophie and I'm a purple cat!

# 7
# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty

# 8
# class Person
#   # # attr_accessor :secret
#   # def initialize
#   #   @secret
#   # end

#   def secret
#     @secret
#   end

#   def secret=(new_secret)
#     @secret = new_secret
#   end
# end


# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

# 9
# class Person
#   attr_writer :secret

#   def share_secret
#     p secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

# 10

# class Person
#   attr_writer :secret

#   def compare_secret(other_person)
#     @secret == other_person.secret
#   end

#   protected

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'

# person2 = Person.new
# person2.secret = 'Shh.. this is a different secret!'

# puts person1.compare_secret(person2)