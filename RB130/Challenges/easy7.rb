=begin
Octal class
- need to convert do octal to decimal conversion
- constructor method that takes a stringsc
- to_decimal method that converts the integer from octal to
decimal
  - invalid inpout is octal 0

=end

class Octal
  attr_reader :num
  def initialize(num)
    @num = num

  end

  def to_decimal
    return 0 if !valid?
    arr = []
    counter = num.to_s.chars.size - 1
    num.to_s.chars.map(&:to_i).each do |n|
      # p "#{n} ** #{counter}"
      arr << n *8 ** counter
      counter -= 1
    end
    arr.sum
  end

  def valid?
    arr = num.to_s.chars#.map(&:to_i)
    tf = arr.map do |n|
      n.match(/[0-7]/)
      # (0..7).to_a.include? n && ("a".."z").include?(n)
    end
    tf.delete(nil)
    tf.size == arr.size ? true : false
    # arr.include?(8) || arr.include?(9)
  end
end

# p Octal.new("6789").valid?
