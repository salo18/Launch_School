# https://www.notion.so/RB120-92490135331c4fe299a72bb523bc05cb?p=3ffb627b4da34934ab83419cd570cc97

=begin
Design a Sports Team (Author Unknown...thank you!)

#- Include 4 players (attacker, midfielder, defender, goalkeeper)
#- All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
#- All players can run and shoot the ball.
#- Attacker should be able to lob the ball
#- Midfielder should be able to pass the ball
#- Defender should be able to block the ball
#- The referee has a whistle. He wears black and is able to run and whistle.
=end

# module Runnable
#   def run
#   end
# end

# class Player
#  include Runnable

#   def initialize
#     @jersey_color = "blue"
#   end

#   def shoot
#   end
# end

# class Attacker < Player
#   def lob
#   end
# end

# class Midfielder < Player
#   def pass
#   end
# end

# class Defender < Player
#   def block
#   end
# end

# class Goalkeeper < Player
#   @jersey_color = "white with blue stripes"
# end

# class Referee
#   include Runnable
#   def initialize
#     @has_whistle = true
#     @jersey_color = "white with blue stripes"
#   end

#   def whistle
#   end
# end


=begin
Preschool (by Natalie Thompson)

# Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers.
# Both teachers and assistants can help a student with schoolwork and watch them on the playground.
# A teacher teaches
# assistant helps kids with any bathroom emergencies.
# Kids themselves can learn and play.
# A teacher and principle can supervise a class.
# Only the principle has the ability to expel a kid.
# Janitors have the ability to clean.
# Cafeteria workers have the ability to serve food.
# Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.
=end

# module HwHelpable
#   def hw_help
#   end
# end

# module Supervisable
#   def supervise_class
#   end
# end

# module Watchable
#   def watch_children_play
#   end
# end

# class Preschool
#   def eat_lunch
#   end
# end

# class Children < Preschool
#   def learn
#   end

#   def play
#   end
# end

# class Teachers < Preschool
#   include HwHelpable
#   include Supervisable
#   include Watchable

#   def teach
#   end
# end

# class Assistants < Preschool
#   include HwHelpable
#   include Watchable

#   def bathroom_help
#   end
# end

# class Principle < Preschool
#   include Supervisable

#   def expel
#   end
# end

# class Janitors < Preschool
#   def clean
#   end
# end

# class CafeteriaWorkers < Preschool
#   def serve_food
#   end
# end


=begin
# There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
# Both general dentists and oral surgeons can pull teeth.
# Orthodontists cannot pull teeth.
# Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists.
# All dentists graduated from dental school.
# Oral surgeons place implants.
# General dentists fill teeth
=end

# module Pullable
#   def pull_teeth
#   end
# end

# class Dentist
#   def initialize
#     @graduated = true
#   end
# end

# class OralSurgeons
#   include Pullable

#   def place_implants
#   end
# end

# class Orthodontists
#   def straighten_teeth
#   end
# end

# class GeneralDentist
#   include Pullable

#   def fill_teeth
#   end
# end





=begin
# This exercise asks you to come up with a class design for a Role-playing Game.

# The application has information about every player. They all have a name, health, strength and intelligence.

# When each player is created, it gets:

# a health value of 100
# a random strength value (between 2 and 12, inclusive)
# a random intelligence value (between 2 and 12 inclusive)
# The random values are determined by a call to a #roll_dice method that cannot be accessed outside of the class.

# You can set and change the strength and intelligence in the constructors. However, once an object is constructed, the values may not change.

# Health can only be changed by the methods #heal and #hurt. Each method accepts one argument, the amount of change to the health. The #heal increases the health value by the indicated amount, while the #hurt decreases the value.

# A player can be a warrior, a paladin, a magician, or a bard.

# Warriors receive an additional 2 points of strength when they're created. The resulting strength range is thus between 4 and 14, inclusive.

# Magicians receive an additional 2 points of intelligence when they're created. The resulting intelligence range is thus between 4 and 14, inclusive.

# Warriors and paladins have the ability to wear armor. They need access to 2 additional methods: #attach_armor and #remove_armor.

# Paladins, magicians and bards can cast spells. They need access to a #cast_spell method, that accepts one argument, spell.

# Bards are a special type of magician that can also create potions. They have a #create_potion method.

If you pass a player instance to #puts, it should print information about the player in this format:
Name: John
Class: Warrior
Health: 100
Strength: 7
Inteligence: 5
=end

# module Armorable
#   def attach_armor
#   end

#   def remove_armor
#   end
# end

# module Spellable
#   def cast_spell(spell)
#   end
# end

# class Player
#   attr_reader :name, :health, :strength, :intelligence
#   attr_writer :health

#   def initialize(name)
#     @name = name
#     @health = 100
#     @strength = roll_dice(2, 12)
#     @intelligence = roll_dice(2, 12)
#   end

#   def to_s
#     puts "Name: #{name}"
#     puts "Class: #{self.class}"
#     puts "Health: #{health}"
#     puts "Strength: #{strength}"
#     puts "Intelligence: #{intelligence}"
#   end

#   def heal(change)
#     self.health = health + change
#   end

#   def hurt(change)
#     self.health = health - change
#   end

#   private
#   def roll_dice(low, high)
#     (low..high).to_a.sample
#   end

#   attr_writer :strength, :intelligence
# end

# class Warrior < Player
#   include Armorable
#   def initialize(name)
#     super(name)
#     @strength = roll_dice(4, 14)
#   end
# end

# class Paladin < Player
#   include Armorable
#   include Spellable
# end

# class Magician < Player
#   include Spellable
#   def initialize(name)
#     super(name)
#     @intelligence = roll_dice(4, 14)
#   end
# end

# class Bard < Player
#   include Spellable

#   def create_potion
#   end
# end

# puts Warrior.new("Bob")
# puts Paladin.new("Paddy")
# puts Magician.new("Dave")
# puts Bard.new("Simpson")



# TEST NOTES:
# need to fix puts on spike --- encoding and object are showing up


=begin
# Fish and birds are both types of animal
# All animals can eat
# Fish can swim, but not all animals can swim
# Birds can fly, but not all animals can fly
# Ducks are a type of bird that can swim, but some other birds cannot swim
=end





# come back to q 10 -- #== borrows functionality of the integer class == to compare the return values?

# q 12 --- 3 ways to create getters??

=begin
You're designing a Pet Shelter App that tracks dogs and cats that are in the shelter, and have identified three classes
that you need: PetShelter, Dog, and Cat. Each PetShelter has one or more Dogs and one or more Cats. In our application, the
Dogs and Cats don't interact directly, and neither needs to know anything about the PetShelter to which they belong.

Given the above details, what kind of Object Oriented relationship (inheritance, mixin, collaboration, or none) should
exist between objects of each pair of classes, and why?

PetShelter and Dog
PetShelter and Cat
Cat and Dog
=end


