=begin
SumofMultiples class
- instance method that takes optional arguments
  - default parameters are 3 and 5
- #to instance method
  - finds all the natural numbers up to that number
  - sums them up and returns them
-

extra credit - raise error if integer is not passed in
=end

class SumOfMultiples
  attr_reader :numbers

  def initialize(*arg)
    @numbers = arg
    @numbers = [3, 5] if arg.empty?
  end

  def to(num)
   numbers.map do |x|
      1.upto(num-1).select do |n|
        # p "#{n} % #{x} = #{n % x}"
        n % x == 0
      end
    end.flatten.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end
end

p SumOfMultiples.to(10)
