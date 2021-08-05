# Write a method that takes two arguments: the first is the starting number
# and the second is the ending number. Print out all the numbers between the two
# numbers, except if a number is divisible by 3, print "fizz". If a number is divisible
# by 5, print "buzz". If a number is divisible by 3 and 5 print "fizzbuzz".

# input
# fizzbuzz(1, 15)

# output
# 1, 2, "Fizz", etc etc

def fizzbuzz(num1, num2)

  num = (num1..num2).to_a

  final_num = num.map do |n|
                if n % 3 == 0 && n % 5 == 0
                  "Fizzbuzz"
                elsif n % 3 == 0
                  "Fizz"
                elsif n % 5 == 0
                  "Buzz"
                else
                  n
                end
              end

  p final_num.join(', ')
end

fizzbuzz(1, 15)