# https://stackoverflow.com/questions/3534449/why-does-ruby-have-both-private-and-protected-methods

# class Animal
#   def animal_call
#     protect_me
#   end

#   private

#   def protect_me
#     p "protect_me called from #{self.class}"
#   end
# end

# # n= Animal.new
# # n.animal_call #=> protect_me called from Animal
# # n.protect_me #=>error: protected method `protect_me' called

# class Mammal < Animal
#   def mammal_call
#     protect_me
#   end
# end

# class Amphibian < Animal
#   def amphi_call
#     Animal.new.animal_call #Receiver same as self
#     self.animal_call  #Receiver is self
#   end
# end

# n= Amphibian.new
# n.amphi_call



# n= Mammal.new
# n.mammal_call #=> protect_me called from Mammal

# class Tree
#   def tree_call
#     Mammal.new.protect_me #Receiver is not same as self
#   end
# end

# n= Tree.new
# n.tree_call


=begin
https://naturaily.com/blog/public-private-protected-ruby

T of F?
Public methods have no access control - they can be called from the outside of the class definition by the instance of
that class or it’s subclasses.
  # True
Both protected and private methods cannot be called from the outside of the defining class.
  # True
Protected methods are accessible from the subclass and private methods are not.
  # False -- both are accessible from subclasses
Private methods of the defining class can be invoked by any instance of that class.
  # False -- can't be called by an explicit receiver -- is an explicit receiver an instance of a class???
Public access is the default one.
  # True

  DIFFERENCE BETWEEN PRIVATE AND PROTECTED METHODS... private can't be called on an explicit receiver
=end

# class Region
#   attr_accessor :name

#   def initialize(name, population, area_size, continent)
#     self.name = name
#     self.population = population
#     self.area_size = area_size
#     self.continent = continent
#   end

#   def greeting
#     puts name_info + population_info
#   end

#   def more_densely_populated?(other_region)
#     # this method returns an error because private method #population_density is called on an explicit receiver `other_region`
#     result = population_density > other_region.population_density ? 'more' : 'less'
#     puts "#{name} is #{result} densely populated than #{other_region.name}."
#   end

#   def the_same_continent?(other_region)
#     # this method does not return an error because `continent` is a protected (not private) method
#     if continent.eql?(other_region.continent)
#       puts "#{name} and #{other_region.name} lie in the same continent."
#     else
#       puts "#{name} and #{other_region.name} lie in the different continents."
#     end
#   end

#   def can_be_crowdy?
#     if self.consider_as_densely_populated?
#       puts "#{name} can be crowdy."
#     else
#       "There is enough space in the #{name}."
#     end
#   end

#   protected

#   attr_accessor :continent

#   def name_info
#     "Hello, I'm #{name}!"
#   end

#   private

#   attr_accessor :population, :area_size

#   def population_info
#     " #{population} people live here."
#   end

#   def population_density
#     population / area_size
#   end

#   def consider_as_densely_populated?
#     population_density > self.class::HIGH_POPULATION_DENSITY
#   end
#  end

#  class Country < Region
#   HIGH_POPULATION_DENSITY = 300

#   def own_greeting
#     puts "The country name: #{name}." + population_info
#   end
#  end

#  class City < Region
#   HIGH_POPULATION_DENSITY = 3000

#   def own_greeting
#     puts name_info + " The population: #{population} people."
#   end
#  end

#  # initialization
#  wroclaw = City.new('Wroclaw', 638_000, 293, 'Europe')
#  san_francisco = City.new('San Francisco', 884_000, 121, 'Northern America')
#  poland = Country.new('Poland', 38_000_000, 312_000, 'Europe')

# # section 1
# # No problem here... #greeting invokes protected and private methods so they are accessible since they are not
# # being called directly
# #  wroclaw.greeting
# #  poland.greeting

# # section 2
# #  NoMethodError since the protected and private method are being called directly
# #  wroclaw.name_info
# #  wroclaw.population_info

# # section 3
# # No problem here... #own_greeting is called from within the subclasses and private/protected methods are not invoked directly
# #  wroclaw.own_greeting
# #  poland.own_greeting

# # section 4
# #  wroclaw.more_densely_populated?(san_francisco)
#   #  doesn't work because private method is called on explicit receiver
# #  wroclaw.the_same_continent?(san_francisco)
#   #  works because protected method is called on explicit receiver and that is allowed
# #  san_francisco.can_be_crowdy?
#   #  doesn't work because self is also considered an explicit receiver


class Dog
  # attr_reader :age
  def initialize(age)
    @age = age
  end

  def is_older?(other_dog)
    if age > other_dog.age
      puts "Yes, I'm older!"
    else
      puts "no I'm younger"
    end
  end

  protected

  attr_reader :age

  def barky
    puts "woof"
  end

end

dog = Dog.new(1)
# dog.bark

doggo = Dog.new(2)

doggo.is_older?(dog)
# doggo.bark(dog)