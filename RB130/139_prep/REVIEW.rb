# rubocop yourfile -a
# have an extra newline character when you copy paste into the formatted answer

# def method_1(&block) # block to proc
#   puts yield # it is still a block
#   # puts block.call # it only becomes a proc on this line!
#   puts yield # still a block
#  end

#  this_is_a_proc = proc {'is this a proc?'}

#  method_1(&this_is_a_proc) # proc to block


#

# def example
#  puts yield
# end

# def change
#  456
# end

# change = 123

# example {change}



# scope starts above method invocation

# local variables are in the binding if they are initialized before the proc object
# methods and local variables are in scope if they are above the invocation

# def example
#   puts yield
# end
# change = 123

# example = proc { puts change}


# def change
#  456
# end

# change = 3445

# example.call


#
# def sequence
#   counter = 0
#   Proc.new { counter += 1 }
# end

# s1 = sequence
# p s1.call           # => 1
# p s1.call           # => 2
# p s1.call           # => 3
# puts

# s2 = sequence
# p s2.call           # => 1
# p s1.call           # => 4 (note: this is s1)
# p s2.call           # => 2


# lesson 3
# what is rake
# what is bundler
# how do you get gemfile.lock? with bundler instal
#



def true_or_false(&block)
  puts "The block is #{block.call}"
end

true_or_false { 5 > 8 }


# The local variable color isn't part of the Proc object's binding since it isn't in
# scope when the Proc object is instantiated.


# def call_me(some_code)
#   some_code.call
# end

# # name = "Robert"
# chunk_of_code = Proc.new {puts "hi #{name}"}
# def name
#   "rob"
# end
# name = "Griffin III"        # re-assign name after Proc initialization
# call_me(chunk_of_code)




















# def a_method(&block)
#   block.call
#   # puts "block is given" if block_given?
#   # yield
# end


# a_method { |el| p "hi #{el}" }


# def block_method(animal)
#   yield(animal)
# end

# block_method('turtle') { puts "This is a #{animal}."}

# # block_method('turtle') do |turtle, seal|
# #   puts "This is a #{turtle} and a #{seal}."
# # end

# def some(&block) #block to proc
#   block_given?
#   yield
# end

# bloc = proc { p "hi" } # do not alter

# some(&bloc) #proc to block

# def amethod
#   # a = "hi"

#   b = Proc.new { puts a }
#   a = "hi"

#   b.call
# end

# amethod

# my_proc = proc { |thing| puts "This is a #{thing}." }



# # What is outputted and why? Explicit Block Parameter Example

# def my_method(&block)
#   block.call
# end

# my_method { puts "hello" }


# # 1 . `my_method` is defined with an ampersand appended to a parameter `&block`, creating an explicit block parameter.  This is a special optional parameter that converts an implicitly passed in block into a simple Proc object.

# # within the method body, we reference the simple proc object by using its parameter name without the `&` prepended, and invoke the Proc#call method on `block`.

# # On line 7, we invoke `my_method` and pass in the block
# # { puts "hello"} outputting "hello"



# #
# name = 'Santa'

# my_proc = Proc.new do
#   puts name
# end


# def my_method(&block)
#   block.call
# end

# my_method(my_proc) { puts "hello" }

# # ArgumentError raised (given 1, expected 0) because methods have strict arity meaning the number of arguments and method parameters must match. In this case, the optional explicit block parameter is for our implicit block,`{ puts "hello" }` so there's no parameter for  our `my_proc` argument


# #

# def lambda_demo_method
#   lambda_demo = lambda { return "Will I print?" }
#   lambda_demo.call
#   "Sorry - it's me that's printed."
# end

# puts lambda_demo_method # Sorry - it's me that's printed.
# # (Notice that the lambda returns back to the method in order to complete it.)


# def proc_demo_method
#   proc_demo = Proc.new { return "Only I print!" }
#   proc_demo.call
#   "But what about me?" # Never reached
# end

# puts proc_demo_method # Only I print!
# # (Notice that the proc breaks out of the method when it returns the value.)


# # ===============
# def batman_ironman_proc
#   victor = Proc.new { return "Batman will win!" }
#   victor.call
#   "Iron Man will win!"
# end

# puts batman_ironman_proc

# def batman_ironman_lambda
#   victor = lambda { return "Batman will win!" }
#   victor.call
#   "Iron Man will win!"
# end

# puts batman_ironman_lambda


# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.












# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# # my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}






=begin

# implicit blocks
# arity (lenient arity


def a_method(&block_to_proc) # block.to_proc
  block_to_proc.call("abc")
end

#a_method {|block_param| puts "#{block_param} and Goodbye" }
#a = :upcase.to_proc # symbol to proc
p a_method(&:upcase) #{ puts "Goodbye" }  #lenient


# map(&:to_i) => map {|el| el.to_i}







# What does `&` do when in a method invocation argument?
# The `&` causes ruby to try to convert the object to a block. If the object is a proc, the conversion happens automatically. If the object is not a proc, then Ruby attempts to call `#to_proc` on the object first, then `&` will convert that proc to a block. If there is no `#to_proc` method provided by the object's class a `TypeError` is raised.


# What is Symbol#to_proc and how is it used?

arr = [1, 2, 3, 4, 5]
p arr.map(&:to_s) # specifically `&:to_s`
# When applied to an argument object for a method, a unary `&` causes ruby to try to convert that object to a block. If that object is a proc, the conversion happens automatically.

p arr.map(&(Proc.new { |n| n.to_s }))
# If the object is not a proc, then `&` attempts to call the `#to_proc` method on the object first. Used with symbols, e.g., &:to_s Ruby creates a proc that calls the #to_s method on a passed object, and....

p arr.map { |n| n.to_s }
# then converts that proc to a block. This is the "symbol to proc" operation (though perhaps it should be called "symbol to block")


# THE WHOLE POINT OF A PROC IS TO SAVE A BLOCK
var = Proc.new { |n| n.to_s }
var = { |n| n.to_s } # can't save a block to a variable... needs a proc object






1. **What are Ruby Version Managers? Why do we need them?**
They're programs that install, uninstall, and manage multiple versions of Ruby, the utilities (such as irb) associated with each version, and the RubyGems installed for each Ruby. They're needed because sometimes we need to run specific versions of ruby with certain programs and environments.
For example, when collaborating on a project with other developers, it's important to agree on what version of Ruby will be used. This ensures that different parts of the code base don't become incompatible. Being able to switch between versions-with ease-to work on various projects is a must.


2. **Give some examples of available Ruby Version Managers and what they can do for you.**
RVM manages and installs different versions of Ruby and gemsets, and has more features-like it's own built-in Ruby installation mechanism. It manages project dependencies in one of two ways; the conventional way by using gemsets or by using Bundler. RVM meets the requirements to manage large and complex projects.

Rbenv only *manages* different ruby versions. It doesn't manage gemsets nor install different Ruby versions, these features are handled by third-party tools called "plug-ins" and can be acquired by installing them. For example, rbenv doesn't have it's own built-in Ruby installation mechanism but the plug-in `ruby-build` installs the versions for us. Rbenv also manages project dependencies in one of two ways; using a plug-in called `rbenv-gemsets` which is the RVM `gemset` equivalent or via Bundler. rbenv is considered a lightweight tool, since it lacks the built-in features required to manage large projects, and--used alone--more suitable for working on simple and small Ruby projects.


3. **What are RubyGems? How are they used? Where can you find them?**
Also simply called 'gems', they're packages of code that we can download, install, and use in our Ruby programs or from the command line. They're used to add functionality to our Ruby programs. They're found on the Ruby community's gem hosting service RubyGem.org.


4. **How do you manage RubyGems in your own environment?**
Ruby-version 1.9 or higher-includes a `gem` program that allows us to connect to the remote RubyGem library and-thru the use of various commands-manage downloaded gems on our local file system.


5. **How do you include RubyGems in projects you create?**
If we're using gems in our Ruby programs, we `require` them (e.g., `require pry` at the top of our .rb file) or from the command line `rubocop` checks for Ruby style guide violations and other potential issues in our code.


6. **What is Bundler? What does it do and why is it useful?**
Bundler is a dependency manager, it lets us describe exactly which Ruby and Gems we want to use with our Ruby apps. Specifically, it lets us install multiple versions of each Gem-including their gem dependencies-under a specific version of Ruby and then use the proper version in our app.


6. **What is Rake? What does it do and why is it useful?**
A RubyGem that automates tasks. It automates many common functions required to build, test, package, and install programs. Such as running tests, building databases, packaging and releasing the software, etc.

For example, to release a new version of an existing program, you may want to:
* Run all tests associated with the program.
* Increment the version number.
* Create your release notes.
* Make a complete backup of your local repo.

By automating tasks with Rake: we ensure steps are executed in a proper order (e.g., setting the new version number before committing changes); we won't be at the mercy of typos that may do the wrong thing; and we don't have to try to remember each and every step ourselves.


G. **What is the RubyGems format for projects?**
How should files be set up in your project; test files, lib, file


G. **What is a .gemspec file?**
It's a file that's included if we're creating our own gems. It lists specifications for our gem, version numbers


7. **What constitues a Ruby project?**
A collection of one or more files used to develop, test, build, and distribute software. The software may be an executable program, a library module, or a combination of programs and library files. The project itself includes the source code (not only Ruby source code, but any language used by the project, such as JavaScript), tests, assets, HTML files, databases, configuration files, and more.


8. **What is the purpose of core tools? / How do the Ruby tools relate to one another?**
Collectively core tools help us build our Ruby projects from beginning to end. Each core tool has its own unique function and is used as needed, at different points of our project's development.



=end

# def some_method(block) # why does adding a parameter cause an argument error ??
#   block_given?
# end

# bloc = proc { puts "hi" } # object

# p some_method(&bloc) # is this the shorthand?
# p some_method() #= { puts "hi" } ---


# # why does this work??
# def some_method(&block) #block converted to proc
#   p block_given? # we want this to return `true`
# end

# bloc = proc { puts "hi" } # do not alter this code
# some_method(&bloc) # proc converted to block


# def some_method(&block) # block > proc
#   p block_given? # we want this to return `true`
# end

# bloc = proc { puts "hi" } # do not alter this code
# some_method(&bloc) # sym > proc > block



# def a_method(&block)
#   p block_given?
#   block.call
#   #yield if block_given?
# end

# a_method { puts "Hi" }





# proc is a way of encapsulating a block to pass around for later

# # How blocks work, and when we want to use them.
# def method(&a) # block to proc
#   a.call
#   yield if block_given?
# end

# method proc { puts "sup" } # block is still an implicit block and it is being executed by the yield keyword

# # explicit blocks are regulated by rules of methods - strict arity, must be passed in
# # implict blocks executed if there is a yield keyword but this has nothing to do with arity
# # implicit blocks are ignored without the yield keyword (and they are optional)
# #   - if there is a yield keyword and no implicit block, its a local jump error not an argument error (so not related to arity)





# def a_method(&block)
#   puts yield.class # String
#   puts block.class # Proc # ITS ONLY A PROC WHEN YOU CALL IT OTHERWISE ITS STILL THE ORIGINAL OBJECT
#   puts yield.class # String
#  end

#  this_is_a_proc = proc {'is this a proc?'}

#  a_method(&this_is_a_proc)

# When working with explicit blocks, the & converts the block to a simple Proc object that can then be referenced inside the method.
# Depending on the method implementation, the parameter is either a block or a proc object. It becomes a proc object when a proc method is invoked on it
# otherwise it will stay as whatever the block returns


# def a_method(a, &block) # to proc
#   puts a.call
#   block.call
# end

# this_is_a_proc = proc {'is thisoc?'}

# a_method(this_is_a_proc) {'is this a proc?'} #to block


# BINDING
# def sequence
#   counter = 0
#   Proc.new { counter += 1 }
# end

# s1 = sequence
# p s1.call           # => 1
# p s1.call           # => 2
# p s1.call           # => 3
# puts

# s2 = sequence
# p s2.call           # => 1
# p s1.call           # => 4 (note: this is s1)
# p s2.call           # => 2


# What is the return value of a block?
# >> the last evaluated expression -- like a method without borders
# >> dr
# What is the return value of a proc?
# the last evaluated expression


# binding will always go after the local variable first


# change = 123

# def change
#  456
# end

# def example
#  puts yield
# end



# example {change} # scope is anything above the method invocation not the method definition


# rvm - ruby version manager
# rake
# bundler - bundles the gems and manages dependencies

# USE RUBY 2.7

# methods and lambdas - strict arity
# blocks and procs - lenient arity
# rubocop file.rb -a  CHECK THIS

# turning in the file -- must have empty rubocop
