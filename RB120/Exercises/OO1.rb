# 1
# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# 2 / 3 / 4 / 5
module Walkable
  def walk
    p "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def greet
    p "Hello! My name is #{name}"
  end
end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk