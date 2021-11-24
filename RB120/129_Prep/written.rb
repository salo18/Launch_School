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

# 18
# class Shape
#   @@sides = 5

#   def self.sides
#     @@sides
#   end

#   def sides
#     @@sides
#   end
# end

# class Triangle < Shape
#   def initialize
#     @@sides = 3
#   end
# end

# class Quadrilateral < Shape
#   def initialize
#     @@sides = 4
#   end
# end

# p Triangle.sides
# p Triangle.new.sides
# p Quadrilateral.sides
# p Quadrilateral.new.sides

=begin
# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about
class variables?

`Triangle.sides` returns `nil` because no object from the Shape class or any subclass has been instantiated yet so class variable
@@sides still points to `nil`.

`Triangle.new.sides` returns `3`. Since we are instantiating a new Triangle object, the code is run and class variable `sides`
is assigned to `3` in the `Triangle#initialize` method.

This example demonstrates how class variables can be accessed from instance methods and class methods.
=end

# 19
=begin
# What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable
in our class? Give an example.

The attr_accessor method is a method that creates both a getter and setter method as well as assign an instance variable
based on the symbol that is passed in as an argument. There are certain situations where we would only want to display data
(not edit) or edit data (but not display it) so using an attr_accessor method would not work for these situations.

Using an attr_accessor method also doesn't let us write a custom getter or setter method in case that is necessary but this
depends on the needs of the program.
=end

# if we want the user to be able to be able to change the card information of their existing card but not show them the data
# that is already in the program...
# and if we want the user to be able to see their name but not be able to change it

# class CardData
#   attr_writer :card_number
#   attr_reader :name

#   def initialize(name, card_number)
#     @name = name
#     @card_number = card_number
#   end
# end

# 20
=begin
# What is the difference between states and behaviors?
- states track attributes about an object, (for example, their name) and are kept track of using instance variables
- behaviors are what an object can do and are defined by instance methods

objects do not share state with other objects but share behaviors with other objects as defined by the instance methods in their
class. The only way objects of the same class can share state is through a class variable.
=end

# 21
=begin
# What is the difference between instance methods and class methods?
Instance methods are the behaviors that objects of the class have access to. They are called on the individual object level.
Class methods are called on the class itself and must be prepended with the `self` keyword upon definition. Class methods can
be called without having to instantiate any objects in the class.
=end

# 22
=begin
# What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.
Collaborator objects are objects that are stored as state in another object. For example, if we want to keep track of a Human’s
“pets”, we could create an instance variable `@pets` that points to an empty array. When the Human gets a new pet, we can add an
instance of a pet class to the array. The Dog object that is added to the @pets array is now a part of the Human object’s state
and is thus a collaborator object of the Human object.
=end

# class Human
#   attr_accessor :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end
# end

# class Dog
# end

# human = Human.new("Bob")
# buddy = Dog.new
# human.pets << buddy\
# p human.pets

# 23
=begin
# How and why would we implement a fake operator in a custom class? Give an example.
A fake operator is something that looks like it would be an operator but is actually a method that can be overridden in a
custom class. For example, == looks like an operator since = is an operator. == is in fact a method. If we want to compare
two objects or a specific part of their states, we can override ==. == currently checks if the objects are the same. Since
two objects have a different object id (as can be checked with the #object_id method), #== will always return false. What if
we wanted to check if two objects have the same value in their `name` state? We can write a custom #== method that checks the
current `name` state with that of another object’s `name` state.
=end

# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     name == other.name
#   end
# end

# person1 = Person.new("Bob")
# person2 = Person.new("Bob")

# p person1 == person2

# 24
=begin
# What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.
`self` is a keyword that can be used to clarify what object we are working with inside of a class. This all depends on how `self`
is used.

If `self` is used inside an instance method definition, it is used to invoke the object’s setter method in order to reassign
the value in an instance variable’s state. Without using self in this context, Ruby would think we are initializing a new
local variable rather than changing the state of an instance variable. From within an instance method, self refers to the
calling object.

If `self` is used in a method definition, then this is a class method. When self is referenced in a class but outside an
instance method, it is referring to the class.
=end

# class Person
#   puts self
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def change_name(new_name)
#     self.name = new_name
#   end

#   def self.display
#     puts "I am a #{self}"
#   end

#   def whatisself
#     self
#   end
# end

# ab = Person.new("AB")
# # p ab.name
# # ab.change_name("BC")

# # p ab.name

# Person.display
# p ab.whatisself

# 25
# class Person
#   attr_reader :type
#   def initialize(n)
#     @name = n
#   end

#   def get_name

#     @name
#   end
# end

# bob = Person.new('bob')
# joe = Person.new('joe')

# puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
# puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

# p bob.get_name # => "bob"
# p bob.type

=begin
# What does the above code demonstrate about how instance variables are scoped?
This code demonstrates that instance variables are scoped at the object level and can be accessed within any instance method
in the class unlike a local variable that is only accessible in the method it is initialized in. The example also demonstrates
how an instance variable must be initialized inside an instance method.
=end

# 26
=begin
# How do class inheritance and mixing in modules affect instance variable scope? Give an example.
Instance variables are scoped at the object level. An instance variable initialized in a class is accessible to all the class’s
subclasses. Same goes for modules that are mixed in to the class and its subclasses. However, an instance variable will return
nil unless it is initialized inside a instance method and the instance method is invoked (unlike a local variable that will
return an error).

Unlike instance methods, instance variables are not inherited by subclasses though they are accessible to those subclasses.
For example, if a subclass object is printed using the #p method, the subclass object will be output. However, if the superclass’s
instance variable getter method is invoked, and then the object is output by #p, we will see the state set on the object.
This demonstrates how the instance variable is accessible to the subclass object but not automatically inherited by it.
=end

# module Swimmable
#   attr_reader :swim

#   def can_swim
#     @swim = true
#   end
# end

# class Animal
#   attr_reader :name

#   def initialize()
#     @name
#   end
# end

# class Mammal < Animal

# end

# class Fish < Animal
#   include Swimmable
#   def set
#     @name = "mammal"
#   end
# end

# a = Animal.new

# b = Fish.new
# p b
# b.set
# p b

# # b.set
# # # p b.name

# # b.can_swim
# # p b.swim

# 27
=begin
# How does encapsulation relate to the public interface of a class?

Encapsulation occurs when Ruby hides or shields data from the public. One form of encapsulation is with private and
protected methods that are not directly accessible to the rest of the code base. Since public methods are accessible to the
rest of the codebase, encapsulation does not occur with public methods.
=end

# 28
# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age  = a * DOG_YEARS
#   end

#   # def to_s
#   #   "I am a #{self.class}, my name is #{name} and I am #{age} years old."
#   # end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky

# What is output and why? How could we output a message of our choice instead?
# The code outputs the object. To output a message we would need to define a custom to_s method.

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age  = a * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky

# How is the output above different than the output of the code below, and why?

# 29
=begin
# When does accidental method overriding occur, and why? Give an example.

Accidental method overriding occurs when you accidentally create a method with the same name as another method in the Ruby
core library. For example, the Object class has many “under the hood” methods that we wouldn’t normally think of using but
affect our program. Overriding this method would potentially create a bug or error in the program. For example, the Object#send
method has important functionalities that we don’t want to override. The easy way to do this is to not create any custom #send
methods in our classes. One Object method that can be overridden without consequence is the `to_s` method.
=end

# 30
=begin
# How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and
private access modifiers.

Method access control is a form of encapsulation that allows us to hide data or functionality away from the rest of the program.
Here are the three types of access modifiers with corresponding examples:
=end
# Public methods:

# class Human
#   def say_something
#     puts "Hello world"
#   end
# end

# hu = Human.new
# hu.say_something
=begin
This example demonstrates how a public method is defined in a class and how it can be called by any object of the class without
restriction. Anyone who can access the program and knows the method can call it.
=end

# Protected and private methods:
# class Human
#   # attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def compare(other)
#     compare_name(other)
#   end

#   private
#   def compare_name(other_name)
#     # call_me
#     name == other_name.name
#   end

#   # def call_me
#   #   puts "hi"
#   # end
#   attr_reader :name
# end

# hu = Human.new("Bob")
# man = Human.new("Bob")
# # p hu.call_me
# p hu.compare(man)

=begin
This example demonstrates how private and protected methods cannot be called directly and must be invoked indirectly
through another method call, in this case the #compare method. The main difference between private and protected methods are that
private methods cannot be called on an explicit receiver
=end

# 31
=begin
# Describe the distinction between modules and classes.
The main difference between modules and classes are that you cannot instantiate an object from a module (only a class).
Modules are used for “has-a” relationship while classes are used for “is-a” relationship. For example. Dogs is the superclass
and a subclass can be Poodles. Poodles are a type of Dog. Poodles also have an ability to swim, bark, run, etc and these can
all be modules that are mixed in with the `include` method invocation.
=end

# 32
# What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

=begin
Polymorphism is the ability for different data types to respond to a common interface. There are a few types of polymorphism:
Polymorphism through class inheritance
  Classes allow their subclasses to inherit instance and class methods. Objects that share the same superclass have access
  to the methods in the superclass
=end

  # class Dog
  #   def bark
  #     puts "woof"
  #   end
  # end

  # class Poodle < Dog
  # end

  # class Bulldog < Dog
  # end

  # poodle = Poodle.new
  # bulldog = Bulldog.new
  # dogs = [poodle, bulldog]
  # dogs.each {|dog| dog.bark }



# Polymorphism through interface inheritance - modules and mixins.
  # Modules can be mixed in to add functionality to a program.

# Polymorphism through duck typing
  # When unrelated classes use a method with the same name for a similar purpose. This must be by design though. Just because
  # two classes use the same method name, doesn’t make it polymorphism. There must be intention too.

# class Human
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   # define getter and setter methods
#   # then show how these can be replaced by attr methods
# end

# bob = Human.new("Bob")
# bob.walk # "I'm walking..."
# p bob.name # "Bob"

# module Walkable
#   attr_reader :swimmer

#   def swim
#     @can_swim = true
#     @swimmer = "Bob"
#   end

#   def walk
#     puts "I'm walking"
#   end
# end

# class Human
#   include Walkable
# end

# joe = Human.new
# joe.swim
# p joe.swimmer



# class Human
#   # attr_writer :name
#   attr_reader :name

#   def name=(name)
#     @name = name
#   end
#   # def change_name
#   #   @name = "Bob"
#   #   p @name
#   #   self.name = "Joe"
#   #   p @name
#   # end
# end

# bob = Human.new
# bob.name = "Bob"
# p bob.name
# bob.name = "Joe"
# p bob.name


# class TestingWriter
#   attr_writer :test

#   def display
#     self
#   end
# end

# writer = TestingWriter.new
# p writer.display # => <TestingWriter:0x00007f93c6857080>


# writer.test = "oh hi mark"
# p writer.display # => <TestingWriter:0x00007f93c6857080 @test="oh hi mark">

# # this will return "oh hi mark", thus an instance variable was created

# class TestingReader
#   attr_reader :test

#   def display
#     self
#   end

#   def assign
#     @test = "hi"
#   end
# end


# reader = TestingReader.new
# p reader.display # => <TestingReader:0x00007f93c6856ce8>
# reader.assign
# p reader.display # => <TestingReader:0x00007f93c6856ce8 @test="hi">
# # this will return nil, thus an instance variable has been created, though no value has been assigned to it, so it is set to nil


# lexical scope:
module Tree
  # TOES = 10
  class Unrelated
    TOES = 10
  end
end


# class Mammal
#   # include Tree
#   # FINGERS = 10

#   def reveal
#     puts "I have #{Tree::Unrelated::TOES} fingers"
#   end
# end

# class Person < Mammal
# end

# m = Person.new
# m.reveal

# p Tree::Unrelated::TOES




module Movable
  def move
    # puts "I'm flexing #{FINGERS} fingers." # this does not work

    puts "I'm flexing #{Child::FINGERS} fingers." # this works
    puts "I'm flexing #{Human::FINGERS} fingers." # this works
  end
end

class Human
  FINGERS = 10
end

class Child < Human
  include Movable
  def show_fingers
    puts "I have #{Human::FINGERS} fingers."
  end
end

# Child.new.show_fingers
Child.new.move