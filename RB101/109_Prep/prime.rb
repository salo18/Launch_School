# Write a method that takes two numbers. It should print out all primes between
# the two numbers. Don't use Ruby's prime class.

def is_prime?(num)
  # if num == 5
  #   return true
  # elsif num == 3
  #   return true
  # elsif num % 2 == 0 || num % 3 == 0 || num % 4 == 0 || num % 5 == 0 ||
  #       num % 6 == 0 || num % 8 == 0
  #       return false
  # else
  #   true
  # end

  # LS answer:
  (2..(num-1)).each do |divisor|
    return false if num % divisor == 0
  end
  true
end

def prime(num1, num2)
  range = (num1..num2).to_a
  range.each do |num|
   p num if is_prime?(num)
  end
end

prime(3, 20)
# => 3, 5, 7
