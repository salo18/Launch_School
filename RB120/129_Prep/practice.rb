# https://medium.com/@gcpinckert/group-study-for-launch-schools-rb129-assessment-69630264cc5a

# class DataBase
#   def initialize
#     @things = []
#   end

#   def show_things
#     @things.each do |student|
#       puts "A #{student.class}: #{student}"
#     end
#   end

#   def <<(other_thing)
#     if !@things.include?(other_thing)
#       @things << other_thing
#     else
#       puts "That student is already in the database"
#     end
#   end
# end

# class Student
#   attr_reader :name, :id
#   def initialize(name, id)
#     @name = name
#     @id = id
#   end

#   def ==(other)
#     self.id == other.id
#   end

#   def to_s
#     name
#   end
# end

# jill1 = Student.new('Jill', 12345)
# jill2 = Student.new('Jill', 67890)
# jill3 = Student.new('Jill', 12345)

# p jill1 == jill2              # false
# p jill1 == jill3              # true


# kids = DataBase.new

# kids << jill1
# kids << jill2
# kids << jill3  # => That student is already in the database

# p kids.show_things
#   # => A Student: Jill
#   # => A Student: Jill

# class Animal
#   def public_method
#     "Will this work? " + protected_method
#   end

#   private

#   def protected_method
#     "Yes, I am a protected method."
#   end
# end

# animalz = Animal.new
# p animalz.public_method

module Animal
  class Dog
    def bark
      puts "woof"
    end
  end

  class Cat
    def meow
      puts "meow"
    end
  end

  def self.class_method
    puts "I'm a #{self}"
  end
end

bud = Animal::Dog.new
bud.bark
kitty = Animal::Cat.new
kitty.meow

Animal.class_method

