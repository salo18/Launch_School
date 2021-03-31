# Write a method that takes two arguments: the first is the starting number, and the
# second is the ending number. Print out all numbers between the two numbers, except if a
# number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz",
# and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(starting, ending)
  arr = []
  starting.upto(ending) do |num|
    if num % 3 == 0 && num % 5 == 0
      arr << "Fizzbuzz"
    elsif num % 5 == 0
      arr << "Buzz"
    elsif num % 3 == 0
      arr << "Fizz"
    else
      arr << num
    end
  end
  p arr.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


