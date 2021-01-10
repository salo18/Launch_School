# Write a method that takes two arguments, a string and a positive integer, and 
# prints the string as many times as the integer indicates.
# example:
# repeat('Hello', 3)

# My answer:
def repeat(string, i)
  i.times {puts string}
end

# repeat("Hi", 10)

# LS alternatives (user submissions)
def repeat2(string, i)
  if i > 0
    i.times {puts string}
  else 
    puts "please enter a positive integer"
  end
end

# repeat2("sup", -7)

def repeat_loop(string, i)
  loop do 
    puts string 
    i -= 1
    break if i == 0
  end 
end
# repeat_loop("hey", 5)

def repeat_while_loop(string, i)
  while i > 0
    puts string
    i -= 1
  end
end
repeat_while_loop("yo", 4)

