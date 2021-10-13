# 1
# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim"
#   end
# end

# teddy = Bulldog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# 2

# class Pet
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end

# end


# class Dog < Pet
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# class Cat < Pet
#   def speak
#     'meow!'
#   end
# end

# pete = Pet.new
# kitty = Cat.new
# barky = Dog.new

# p pete.run
# p kitty.jump
# p barky.speak

# 3
# Pet is the superclass of Dog and Cat

# 4
# the method lookup path describes the way that ruby evaluates a method invocation on an object.
# ruby will look at the object's class and see if that method is available in that class.
# if the method is not available, ruby will look to the superclass and repeat the process until
# it finds the method or returns an error
