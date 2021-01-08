# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

# My first attempt:
# - can't figure out how to get ruby to actually do the math operation 
# based on a user's input??

# puts "please input a number"
# num1 = gets.chomp.to_i

# puts "please input another number"
# num2 = gets.chomp.to_i

# puts "what type of operation? add subtract multiply or divide?"
# operation = gets.chomp

# if operation == "add"
#   puts '+'
# end 

# puts "#{num1} #{operation} #{num2}"

# LS Answer:
# puts "please input a number"
# num1 = gets.chomp.to_i

# puts "please input another number"
# num2 = gets.chomp.to_i

# puts "what type of operation? add subtract multiply or divide?"
# operation = gets.chomp

# if operation == "add"
#   result = num1 + num2
# elsif operation == "subtract"
#   result = num1 - num2
# elsif operation == "multiply"
#   result = num1 * num2
# elsif operation == "divide"
#   result = num1.to_f / num2.to_f
# end 

# puts "the result is #{result}"

# REFACTORING:

# what did we do to improve the calculator?
# -- added a prompt method to each puts to automatically add => every time we as for input
# -- improved the result for readability by replacing the if statement with case 
# -- created a method to check that the number is valid 

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0 
end 

def operation_to_message(op)
  case op
    when "1"
      "Adding"
    when "2"
      "Subtracting"
    when "3"
      "Multiplying"
    when "4"
      "Dividing"
  end 
end

prompt("Welcome to Calculator! Enter your name")
name = ""
loop do 
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name")
  else 
    break
  end
end

prompt("Hi #{name}!")

loop do #main loop 
  num1 = ""
  loop do 
    prompt("please input a number")
    num1 = gets.chomp.to_i
    if valid_number?(num1)
      break
    else
      prompt("That's not a valid number, try again")
    end
  end 

  num2 = ''

  loop do
    prompt("please input another number")
    num2 = gets.chomp.to_i
    if valid_number?(num2)
      break
    else
      prompt("That's not a valid number, try again")
    end
  end

  prompt("what type of operation? 1) add 2) subtract 3) multiply or 4) divide?")
  
  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please put a number 1 through 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
            when "1"
              num1 + num2
            when "2"
              num1 - num2
            when "3"
              num1 * num2
            when "4"
              num1.to_f / num2.to_f
           end 

  prompt("the result is #{result}")    
  
  prompt("Do you want to use Calculator again? Type Y to calculate again.")
  answer = gets.chomp.downcase
  if answer != "y"
    prompt("Thanks for using Calculator #{name}!") 
    break
  end
end


# Additional questions:
# Is there a better way to validate that the user has input a number? 
  # Yes - right now we are using num.to_i != 0 for number validation which does not let 
  # users type in a 0. This should be allowed in some form. 

# Our operation_to_message method is a little dangerous, because we're relying on the 
# case statement being the last expression in the method. What if we needed to add some 
# code after the case statement within the method? What changes would be needed to keep 
# the method working with the rest of the program?
  # we would need to write "return" at the beginning of the case statement so that the
  # method knows it needs to be returned? 

#  how come we can also omit the Kernel.?
  # not too sure why... 
  # LS answer... kernel methods are available everywhere in ruby so no need to put kernel
  # in front of everything
