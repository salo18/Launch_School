https://github.com/W-Sho-Sugihara/RB139/blob/7aeb790f6f17aea4d0457239c3a1938315f5db21/study_questions.md#blocks

QUESTIONS:
- how does Ruby convert a proc to block with & as method argument?
- X - what is going on here? -- Proc.new {puts "hi #{name}"}
  - a proc object with an implicit block?
- We are converting block to proc -- why does that work on the second /third line of the method? Block_given and yield are responding to a proc object
def some(&block) #block to proc
  block_given?
  yield
end

bloc = proc { p "hi" } # do not alter

some(&bloc) #proc to block

-



BLOCKS
1, What are closures?
Closures are a way to save a chunk of code for use later on. Closures are created by blocks, Procs and Lambdas.

2, What is binding?
Binding is the way Ruby keeps track of what the closure has access to. Closures are said to bind with their surrounding artifacts, meaning that the closures bind to the variables themselves and not the values they point to.

Binding is the relationship that closures share with their surrounding artifacts. Closures have access to variables, methods, constants, etc based on where they are defined regardless of when or where they are called upon later, we call this behavior and relationship, binding.

3, How does binding affect the scope of closures?
Binding allows for closures to retain access to the values of variables or methods even if the values are reassigned after the closure is created.

4, How do blocks work?
Blocks allow a developer to defer implementation of a method for a later time. In Ruby, methods implicitly accept blocks but ignore them. If a block is passed in explicitly, Ruby knows to expect the block and use it in the method implementation.

5, When do we use blocks? (List the two reasons)
Sandwich code (trying to do something before and after)
  - to measure the time something takes
  - to open and close a file
When we want to defer implementation to a later point

<!-- 6, Describe the two reasons we use blocks, use examples. -->

7, When can you pass a block to a method? Why?
You can pass a block to a method any time since blocks are accepted implicitly (but ignored unless the yield keyword is used). We can also pass a block to a method explicitly using & before the parameter name.

8, How do we make a block argument manditory?
By calling an explicit block using &

9, How do methods access both implicit and explicit blocks passed in?
Implicit blocks can be accessed without any notation but are only accessible with the yield keyword. If you want to explicitly require a block in a method, must use the & notation.

10, What is yield in Ruby and how does it work?
Yield is a keyword that defers implementation of the code to the block. You can pass in arguments to the block by adding them as arguments to the yield keyword.

11, How do we check if a block is passed into a method?
Using the Kernel#block_given? method that returns true or false if a block is available

12, Why is it important to know that methods and blocks can return closures?
???

13, What are the benifits of explicit blocks?
Explicit blocks give us the ability to require a block rather than use the yield keyword with an implicit block. With explicit blocks, the block is converted to a proc, which allows us to pass the proc object to other methods and use Proc methods like Proc#call on the block.

14, Describe the arity differences of blocks, procs, methods and lambdas.
Blocks and procs have lenient arity while methods and lambdas have strict arity. Arity refers to the degree to which the argument count is enforced. With lenient arity, there can be more or less arguments that explicitly stated. With strict arity, the exact number of arguments must be passed in otherwise an exception will be raised.

15, What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)
Lambdas have strict arity while procs have lenient arity. Lambdas are a type of proc and thus cannot be created using Lambda.new like you would be able to with a Proc.

16, What does & do when in a the method parameter? def method(&var); end
When used in a method parameter, & means a block is required. & converts the block to a simple proc object.

17, What does & do when in a method invocation argument? method(&var)
This does the opposite and converts the proc to a block. Before converting the proc to a block, Ruby checks to see that the object passed in is a proc. If it is not a proc, it calls #to_Proc on the object. This is how symbols are converted... First, Ruby calls Symbol#to_proc and then converts the proc into a block.

18, What is happening in the code below?

arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`
Ruby calls Symbol#to_proc on the :to_s symbol and then converts that proc object into a block which becomes {|n| n.to_s}.

19, How do we get the desired output without altering the method or the method invocations?

def call_this
  yield(2)
end

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"

????

20, How do we invoke an explicit block passed into a method using &? Provide example.
def a_method#(&block)
  block.call
  <!-- puts "block is given" if block_given? -->
  <!-- yield -->
end


a_method { |el |p "hi #{el}" }


21, What concept does the following code demonstrate?

def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end

Sandwhich code... we are trying to time how long something takes.

22, What will be outputted from the method invocation block_method('turtle') below? Why does/doesn't it raise an error?

def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

This demonstrates how blocks have lenient arity. The block is expecting two block parameters but the method is only giving it one. The argument is assigned to the block parameter and it is used in the string interpolation. Since blocks don't enforce argument count, the second block parameter evaluates to nil since it does not exist. nil evaluates to an empty string in string interpolation and that is what will be output when the block is called.

23, What will be outputted if we add the follow code to the code above? Why?

block_method('turtle') { puts "This is a #{animal}."}

This will return an undefined local variable or method "animal". The block does not have a block parameter. The method local variable animal is only in scope inside the method so the value assigned to animal (in this case the string "turtle") is not accessible. Since the string turtle is passed in as an argument, it would be accessible if the block took a block parameter. Since it doesn't, this will produce an error.

24, What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)

This will output "hi Griffin". A proc object is passed in as an argument to the `call me` method invocation. Execution moves up to the first line of the method implementation, where the method local variable `some_code` is assigned to the value of `chunk_of_code`. On line 2, Proc#call is invoked which will run whatever code is inside the block that is implicitly available to the Proc object. One would expect the output to be "hi Robert" because the local variable `name` is assigned to the string object robert before the Proc object is instantiated. This example demonstrates how binding works with closures. Since the `name` variable is initialized before the Proc object is instantiated, it is in Proc object's binding, meaning that the Proc retains a reference to the variable itself and not the value it points to. When `name` is reassigned to "Griffin", the Proc will detect the change and use the updated value of `name` when the `call_me` method is invoked.

25, What happens when we change the code as such:

def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)

`name` is initialized after the Proc object is instantiated so it is not within the proc's binding and thus returns an error.


26, What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

def name
  "Joe"
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)

Hi Robert because Ruby prioritizes local variables over methods.

27, Why does the following raise an error?

def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)

The & in `a_method(&a)` tries to convert the string object referenced by local variable `a` into a proc object. Since the String class does not have a #to_proc instance method, the code returns an error.

28, Why does the following code raise an error?

def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)

Because blocks can't be saved as local variables.

29, Why does the following code output false?

def some_method(block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(bloc)

This code outputs false because we are passing in a proc object as an argument to the `some_method` invocation. Without `&` in front of `bloc` we are passing in the proc object directly into the method without first converting it into a block. On line 2 of the method, Kernel#block_given? returns false because a block is not passed in.

30, How do we fix the following code so the output is true? Explain

def some_method(block) # block to proc
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc) # proc to block

To fix this code, we need to add an & to the method invocation. But this by itself will cause an Argument Error - wrong number of arguments. Ruby is saying that we give 0 but expect 1. That is because &bloc is no longer an argument but a block. Without changing the method definition parameter to &block, ruby expects an argument. &block tells Ruby to expect a block instead.

31, How does Kernel#block_given? work?
block_given? looks to see if a block is implicitly available to the method definition.

32, Why do we get an LocalJumpError when executing the below code? & How do we fix it so the output is hi? (2 possible ways)

def some(block) # remove the parameter or add a & and a & to the method invocation
  block_given?
  yield
end

bloc = proc { p "hi" } # do not alter

some(bloc)

because we are passing in a proc object without converting it to a block with the &

33, What does the following code tell us about lambda's? (probably not assess on this but good to know)

bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda

This tells you that lambdas are a type or Proc and not their own type of object.

34, What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assess on this, but good to know ;)

def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end

def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end

lambda_return #=> "Before lambda call."
              #=> "After lambda call."

proc_return #=> "Before proc call."


TESTING WITH MINITEST

28, What is a test suite?
A test suite is a group of tests under a class that inherits from Minitest::Test

29, What is a test?
A test is an individual method that tests something through assertions

30, What is an assertion?
An assertion is the individual statement we are testing against.

31, What do testing framworks provide?
?

32, What are the differences of Minitest vs RSpec
?

33, What is Domain Specific Language (DSL)?
?

34, What is the difference of assertion vs refutation methods?
assertions test that something is true while refutations test that something is false

35, How does assert_equal compare its arguments?
assert_equal compares the expected result to the actual result

36, What is the SEAT approach and what are its benefits?
Setup, Execution, Assertion, Teardown
- set up the variables and objects
- execute the code against the objects
- test the assertions to see if the expected result is true
- teardown (close files or any other job that needs to be done)

37, When does setup and tear down happen when testing?
after each test

38, What is code coverage?
the amount of methods that are covered by your tests

39, What is regression testing?
?

CORE TOOLS
40, What are the purposes of core tools?


41, What are RubyGems and why are they useful?

42, What are Version Managers and why are they useful?
RVM allow you to work with different versions of Ruby

43, What is Bundler and why is it useful?
Bundler allows you to install gems onto specific projects

44, What is Rake and why is it useful?

45, What constitues a Ruby project?
A collection of files and gems that make up a piece of code