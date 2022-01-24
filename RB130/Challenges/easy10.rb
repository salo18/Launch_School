=begin
Series class
 - need to create substrings of X length
 - constructor takes the string of integers as an input
 - slices instance method takes an integer as an argument
  - raise error if input is greater than string length
=end

class Series
  attr_reader :integers
  def initialize(integers)
    @integers = integers
  end

  def slices(length)
    raise ArgumentError.new if length > integers.size
    result = []
    starting = 0
    ending = (length-1)
    integers.chars.each do |el|
      result << integers[starting..ending]
      starting += 1
      ending += 1
      break if ending > (integers.size-1)
    end
    el = result.map do |arr|
      arr.chars.map(&:to_i)
    end
    el
  end
end

p Series.new("31001").slices(3)

# arr = ["310"], ["100"], ["001"]

# new_arr =  arr.map do |a|
#   # a.split
#   arr.map do |el|
#     el.chars.map(&:to_i)#.join(", ").map(&:to_i)
#   end
# end

# p new_arr