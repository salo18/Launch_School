# 1
# class Person
#   attr_reader :name

#   def set_name
#     @name = 'Bob'
#   end
# end

# bob = Person.new
# p bob.name

=begin
# What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

The output is `nil`. The instance variable `name` is initialized inside the `set_name` definition. Since that method
is not invoked in the code, `name` is never actually initialized and thus calling the `name` getter method returns `nil`.
Local variables would return an `undefined local variable` exception. Local variables are also different from instance variables
because they can be only be accessed within the method they are defined in while instance variables are accessible to the
entire class.
=end

# 2
# module Swimmable
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swimmable

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# p teddy.swim

=begin
# What is output and why? What does this demonstrate about instance variables?

The output is `nil` since nothing is printed. In the Swimmable module, the `enable_swimming` method is defined and
the instance variable `@can_swim` is initialized to point to `true`. When the Dog class is defined, the `include`
method is invoked and the Swimmable module is passed in as an argument, giving objects of the Dog class access to
the instance variables and instance methods inside Swimmable. When `swim` is defined, the code will output the string
object `swimming` based on the truthiness of the `@can_swim` instance variable. The local variable `teddy` is
instantiated to point to an instance of the Dog class and then the instance method `Dog#swim` is invoked on `teddy`.
Since `Swimmable#enable_swimming` has not yet been invoked, the instance variable `@can_swim` has not been initialized.
`@can_swim` is thus `nil` so `swimming` will not be output since it does not meet the condition of being truthy
(anything other than false or nil).

=end

# 3
# module Describable
#   def describe_shape
#     "I am a #{self.class} and have #{SIDES} sides."
#   end
# end

# class Shape
#   include Describable

#   def self.sides
#     self::SIDES
#   end

#   def sides
#     self.class::SIDES
#   end
# end

# class Quadrilateral < Shape
#   SIDES = 4
# end

# class Square < Quadrilateral; end

# p Square.sides
# p Square.new.sides
# p Square.new.describe_shape

=begin
# What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods
above?

The output is:
p Square.sides  # 4 - self is Shape
This is a class method called on an object of the Square class. Since Square subclasses from Quadrilateral which subclasses
from Shape, the instance of the Square object has access to the instance and class methods in the Shape class and all included
modules. In this case, self refers to Shape and the SIDES constant is accessible since Square subclasses from Quadrilateral.

p Square.new.sides # error - self is Shape
This is an instance method that calls self, which references the Shape object. The class method invocation returns Square which
then allows us to access the SIDES constant defined in the Quadrilateral class through the :: namespace operator.

p Square.new.describe_shape  # error - shape
This returns an error. While instances of Square objects have access to methods in the Describable module since it is included
in the Shape superclass, we are not referencing the constant correctly. Describable doesn’t have direct access to SIDES. If the
code were referenced like this, it would work: self.class::SIDES
=end

# 4
# class AnimalClass
#   attr_accessor :name, :animals

#   def initialize(name)
#     @name = name
#     @animals = []
#   end

#   def <<(animal)
#     animals << animal
#   end

#   def +(other_class)
#     animals + other_class.animals
#   end
# end

# class Animal
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# mammals = AnimalClass.new('Mammals')
# mammals << Animal.new('Human')
# mammals << Animal.new('Dog')
# mammals << Animal.new('Cat')

# birds = AnimalClass.new('Birds')
# birds << Animal.new('Eagle')
# birds << Animal.new('Blue Jay')
# birds << Animal.new('Penguin')

# some_animal_classes = mammals + birds

# p some_animal_classes

=begin
# What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of
`AnimalClass#+` to be more in line with what we'd expect the method to return?

The output is an array object containing three objects from the Animal class. We would expect an AnimalClass object to be
output instead. In order to do this, we would need to alter the AnimalClass#+ instance method by initializing a local variable
and pointing it to a new AnimalClass object, then use the Array#<< method to add the two arrays of Animal objects into the
new AnimalClass object. The method would then return the new AnimalClass object. The code would now output an AnimalClass
object that contains an array of Animal objects.
=end

# 5
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
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end


# sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info

=begin
# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method
not work as expected?

GoodDog#change_info does not work because Ruby thinks we are initializing new local variables instead of reassigning
existing instance variables as is the desired behavior. To fix this, we would need to prepend self to each line in the method.
Since we have an attr_accessor method invocation for the three instance variables, we have a setter method that allows us to
alter the values of `name` `height` and `weight`
=end

# 6
# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def change_name
#     self.name = name.upcase
#   end
# end

# bob = Person.new('Bob')
# p bob.name
# bob.change_name
# p bob.name

=begin
# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this
code to output `'BOB'`?

The change_name method is missing a self invocation. It should say, self.name = name.upcase. Ruby thinks that change_name
instance method is initializing a local variable when in fact we are trying to invoke the setter method for the name instance
method in order to update the name to a new value.

=end

# 7
# class Vehicle
#   @@wheels = 4

#   def self.wheels
#     @@wheels
#   end
# end

# p Vehicle.wheels

# class Motorcycle < Vehicle
#   @@wheels = 2
# end

# p Motorcycle.wheels
# p Vehicle.wheels

# class Car < Vehicle; end

# p Vehicle.wheels
# p Motorcycle.wheels
# p Car.wheels

=begin
# What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid
using class variables when working with inheritance?

The code above outputs the number of wheels, which at first starts as 4 when the wheels class variable is initialized in the
Vehicle class. However, in the Motorcycle subclass, @@wheels is reassigned to a new value. Since this is a class variable,
it only has one value that is shared by all instances of the class. This can cause confusion like shown in the above example,
and demonstrates why using class variables can lead to confusion and cause errors in the code.
=end

# 8
# class Mammal
#   def initialize(type)
#     @type = type
#   end
# end

# class Animal < Mammal
#   attr_accessor :name

#   def initialize(name, type)
#     super(type)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   def initialize(color, name, type)
#     super(name, type)
#     @color = color
#   end
# end

# bruno = GoodDog.new("brown", "Bob", "dog")
# p bruno

=begin
# What is output and why? What does this demonstrate about `super`?

The output is an instance of the GoodDog class which is referenced by the local variable `bruno`. The object has two instance
variables @name and @color which are both set to the string `brown`. Super passes up the arguments that are passed to the
initialize method up to the object’s superclass, in this case up to Animal. GoodDog already has a color parameter in the
initialize method and the color instance variable is assigned to whatever value is passed in (in this case, “brown”).
Since there is also a `super` method invocation, the argument passed in at instantiation is also passed up to the Animal
class and the GoodDog object inherits the instance variable `name` that is assigned to `brown`.
=end

# 9
# class Animal
#   def initialize
#   end
# end

# class Bear < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# bear = Bear.new("black")

=begin
# What is output and why? What does this demonstrate about `super`?

This outputs an error because the super method invocation is not passed any arguments, meaning that it passes up all the
arguments passed to the initialize method upon object instantiation. In this case, one argument is passed up the inheritance
chain to the Animal class. Since the `initialize` method is empty and doesn’t take any arguments, we are passing up and argument
when the method won’t take one and this causes an error. To fix this code, super should be invoked with two empty parenthesis
that would indicate that no arguments are being passed up the chain.
=end

# 10
# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb
#     "I'm climbing."
#   end
# end

# module Walkable
#   include Climbable

#   def walk
#     "I'm walking."
#   end
# end

# module Danceable
#   def dance
#     "I'm dancing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# module GoodAnimals
#   # include Climbable

#   class GoodDog < Animal
#     include Swimmable
#     include Danceable
#   end

#   class GoodCat < Animal; end
# end

# good_dog = GoodAnimals::GoodCat.new
# # p good_dog.walk
# p good_dog.class.ancestors

=begin
# What is the method lookup path used when invoking `#walk` on `good_dog`?

GoodAnimals::GoodDog
Danceable
Swimable
Animal
Walkable
Climable
GoodAnimals

=end

# 11
# class Animal
#   def eat
#     puts "I eat."
#   end
# end

# class Fish < Animal
#   def eat
#     puts "I eat plankton."
#   end
# end

# class Dog < Animal
#   def eat
#      puts "I eat kibble."
#   end
# end

# def feed_animal(animal)
#   animal.eat
# end

# array_of_animals = [Animal.new, Fish.new, Dog.new]
# array_of_animals.each do |animal|
#   feed_animal(animal)
# end

=begin
# What is output and why? How does this code demonstrate polymorphism?

This code outputs:
“I eat”, “I eat plankton”, “I eat kibble”. A new object from the Animal, Fish and Dog class are instantiated and local
variable `array_of_animals` is assigned to an array containing these objects. The Array#each method is invoked on the
`array_of_animals` local variable with a do..end block passed in as an argument. On each iteration, each object is assigned
to the `animal` parameter and then passed in as an argument to the `feed_animal` method invocation, which is just calling
the `eat` method on its argument. This example demonstrates polymorphism through class inheritance. Each class and subclass
has an #eat method that is overridden by the subclasses to demonstrate behavior that is specific to each type. While the
method implementations are all different, the same method was called on each object thus displaying polymorphic behavior.
=end

# 12
# class Person
#   attr_accessor :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end
# end

# class Pet
#   def jump
#     puts "I'm jumping!"
#   end
# end

# class Cat < Pet; end

# class Bulldog < Pet; end

# bob = Person.new("Robert")

# kitty = Cat.new
# bud = Bulldog.new

# bob.pets << kitty
# bob.pets << bud

# bob.pets.each {|pet| pet.jump}

# p bob.pets

=begin
# We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?

The code raises an error because we are calling the Pet#jump method on an array but not on the array items themselves.
The fix should be an Array#each method invocation.

`kitty` and `bud` represent collaborator objects to the Person object that is referenced by local variable `bob`.
=end

# 13
# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def initialize(name); end

#   def dog_name
#     "bark! bark! #{@name} bark! bark!"
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name

=begin
# What is output and why?
This outputs “bark! Bark! Bark! Bark!”. While a @name instance variable is initialized in the Animal class in its constructor
method, the constructor method for the Dog class (subclass of Animal) overrides Animal’s constructor method so it is not seen
by Ruby in this context. Since Dog’s `initialize` method does not contain any code and no instance variable is initialized,
Dog#dog_name doesn’t recognize a @name instance variable. An uninitialized instance variable returns nil (not an error like a
local variable) so the code will run and no error will be output.
=end

# # 14
# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def ==(other_person)
#     name == other_person.name
#   end
# end

# al = Person.new('Alexander')
# alex = Person.new('Alexander')
# p al == alex # => true

# p al.object_id
# p alex.object_id

=begin
# In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`?

Need to define a custom Person#== method that compares the current object’s `name` instance variable with another object’s
`name` instance variable.

# Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s
`@name` instance variables are the same object? How could we prove our case?

They are not the same object… they are two different objects that share the same state for the `name` instance variable.
The way to check would be to invoke the `object_id` method on each object which would show that we are comparing two different
objects.
=end

# 15
# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "My name is #{name.upcase!}."
#   end
# end

# bob = Person.new('Bob')
# puts bob.name
# puts bob
# puts bob.name

=begin
# What is output on `lines 14, 15, and 16` and why?
`Bob.name` outputs the original string passed into the Person object, “Bob”. `puts bob` invokes the Person#to_s method on the
Person object, which returns “My name is BOB”. Since the `to_s` method mutates the `name` instance variable, “BOB” will be the
output of the `bob.name` invocation. The state is permanently changed because the #upcase! Method is destructive.
=end

# 16
=begin
# Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when
trying to set an instance variable within the class? Give an example.

It’s better to invoke the setter method instance of the instance variable because it is easier to manage and control the
implementation in one place. If we have a setter method and want to have a different implementation than just setting an
instance variable’s value (for example, also outputting something), we can do this by just referencing the instance variable
directly. However, this would need to be repeated each time we do this and does not conform to DRY principles.
=end


# class Player
#   attr_reader :name

#   def name=(n)
#     @name = n.upcase
#   end
# end

# p = Player.new
# p.name = "Bob"

# p p.name


# 17
=begin
Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`.
You would want a custom getter method to customize how the program displays the instance variable. Rather than just being
able to output the instance variable value as would be allowed with an attr_reader method, we can customize the output with a custom
getter method.
=end
# class Player
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   # def name
#   #   puts "hey its #{@name}"
#   # end
# end

# player = Player.new("Bob")
# p player.name