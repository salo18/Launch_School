=begin
- need to determine if a number is abundant, perfect or deficient
ex:
- 6 is a perfect number since its divisors are 1, 2, and 3, and
1 + 2 + 3 = 6.
- 15 is a deficient number since its divisors are 1, 3, and 5 and
1 + 3 + 5 = 9 which is less than 15.
- Prime numbers 7, 13, etc. are always deficient since their only
divisor is 1.

PerfectNumber class
- constructor without an argument
- classify method that takes integer as argument
  - need to output string of the type of number it is
  - raise Standard error if input number is negative

Algorithm:
- iterate through the number and get all divisors (remainder 0) into an array
- add the array
- determine the type based on the sum of the array
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 1
    arr = []
    1.upto(num-1).each do |n|
      arr << n if num %n == 0
    end

    if arr.sum == num
      "perfect"
    elsif arr.sum < num
      "deficient"
    elsif arr.sum > num
      "abundant"
    end
  end
end

# p PerfectNumber.classify(-1)