# https://www.notion.so/RB120-92490135331c4fe299a72bb523bc05cb?p=390fa08140564d8b8a78f67760146fa5

=begin
# Problem by Natalie Thompson
class Person
  def initialize(name, job)
      @name = name
      @job = job
  end

  def to_s; "My name is #{@name} and I am a #{@job}"; end
end

roger = Person.new("Roger", "Carpenter")
puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method.

#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"

# ================================================================

# Problem received from Raul Romero
class Human
    attr_reader :name
    attr_accessor :color
  def initialize(name="Dylan")
    @name = name
    @color
  end

  def hair_colour(new_color="blonde")
    self.color = new_color
    "Hi, my name is #{name} and I have #{color} hair."
  end

  def self.hair_colour(arg)
    Human.new.hair_colour()
  end

end

puts Human.new("Jo").hair_colour("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")
# Should "Hi, my name is Dylan and I have blonde hair."

# CONCEPT == need to instantiate a new object from within class method to have access to its instance variables and methods



# ================================================================

class Human  # Problem received from Raul Romero
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def equal?(other)
    name == other.name
  end

  def +(other)
    "#{name}#{other.name}"
  end


end

gilles = Human.new("gilles")
anna = Human.new("gilles")

puts anna.equal?(gilles) #should output true #
puts anna + gilles # should output annagilles

CONCEPT == can override built in methods and create custom implementations


# ================================================================
#describe what the code below outputs and why from Joseph Ochoa

module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters

  def initialize(name)
    @name = name
    @characters = []
  end

  def display
    @name
  end

  protected
  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable

  def initialize(name)
    super
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) #
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb')
rob = Monster.new('monst')

conan.characters << rob
p conan.display

# class Parent
#   def initialize
#     @name
#     @color
#   end
# end

# class Child < Parent
#   def initialize
#     p super
#   end
# end

# Child.new



# ================================================================

# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing

# class Monster
#   def attack
#     "attacks!"
#   end
# end

# class Barbarian

# end



# ================================================================

# Without adding any methods below, implement a solution; originally by Natalie Thompson,
# this version by Oscar Cortes
class ClassA
  attr_reader :field1, :field2

  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB
  attr_reader :field1

  def initialize
    @field1 = "abc"
  end
end

obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new

p obj1.field1 > obj2.field1
p obj2.field1 > obj3.field1



# ========================================================================
# Unknown
class BenjaminButton
  attr_accessor :actual_age, :appearance_age
  def initialize
    @actual_age = 0
    @appearance_age = 100
  end

  def get_older
    self.actual_age += 1
    self.appearance_age -= 1
  end

  def look_younger
  end

  def die
    self.actual_age = 100
    self.appearance_age = 0
  end
end

benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0


# ========================================================================

# Originally by Natalie Thompson, this version by James Wilson
class Wizard
  attr_reader :name, :hitpoints

  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end

  def fireball
    "casts Fireball for 500 damage!"
  end
end

class Summoner < Wizard
  attr_reader :souls

  def initialize(name, hitpoints)
    super(name, hitpoints)
    @souls = []
  end

  def soul_steal(character)
    @souls << character
  end
end

gandolf = Summoner.new("Gandolf", 100)
p gandolf.name # => "Gandolf"

valdimar = Wizard.new("Valdimar", 200)
p valdimar.fireball #=> "casts fireball for 500 damage!"

p gandolf.hitpoints #=> 100

p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

p gandolf.fireball #=> "casts fireball for 500 damage!"
=end

# ========================================================================

# LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
    "I am #{self.name}, I am a #{self.class.to_s.downcase} and I can ??"
  end
end

class Superhero
  include Flightable
  attr_accessor :ability
  attr_reader :name
  def self.fight_crime
    puts "I am #{self}!"
    Superhero.new("").announce_ability("coding skills")
  end

  def initialize(name)
    @name = name
  end

  def announce_ability(ability)
    # Ability.new -- does this have to come from Ability class?
    puts "I fight crime with my #{ability} ability!"
  end
end

class LSMan < Superhero; end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime
# => I am LSMan!
# => I fight crime with my coding skills ability!


