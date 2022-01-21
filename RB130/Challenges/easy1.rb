# Triangles
=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

PEDAC:
Problem:

Requirements:
- all sides must be length > 0
- sum of the lengths of any two sides must be greater than the length of the third side
- EQUILATERAL:  all three sides the same length.
- ISOSCELES: exactly two sides of the same length.
- SCALENE: all sides of different lengths.

Algorithm:
- determine that three numbers are passed in
- numbers must be greater than 0
- check that sum of any two sides is greater than the length of the third side
  >> raise error if not
- determine

=end

# class Triangle
#   attr_reader :length, :width, :height
#   attr_accessor :kind
#   def initialize(length, width, height)
#     @length = length
#     @width = width
#     @height = height
#     @measurements = [length, width, height]
#     @kind = ""
#   end

#   def valid_triangle?
#     length + width > height && width + height > length  && height + length > width
#     # p "Not a valid triangle" if !triangle
#   end

#   def assign
#     if length == width && length == height && height == width
#       self.kind = "equilateral"
#     elsif length != width && length != height && height != width
#       self.kind = "scalene"
#     else
#       self.kind = "isosceles"
#     end
#   end

# end

# tri = Triangle.new(2,10,10)
# tri.valid_triangle?
# tri.assign
# p tri.kind

class Triangle
  # attr_reader :length, :width, :height
  attr_reader :sides
  # attr_accessor :kind
  def initialize(length, width, height)
    # @length = length
    # @width = width
    # @height = height
    @sides = [length, width, height]
    # @kind = ""
    raise ArgumentError.new "Invalid triangle lengths" unless valid?

  end

  def valid?
    # length + width > height && width + height > length  && height + length > width
    # p "Not a valid triangle" if !triangle
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end

  def kind
    if sides.uniq.size == 1
      "equilateral"
    elsif sides.uniq.size == 2
      "isosceles"
    else
      "scalene"
    end
    # if length == width && length == height && height == width
    #   "equilateral"
    #   # self.kind = "equilateral"
    # elsif length != width && length != height && height != width
    #   # self.kind = "scalene"
    #   "scalene"
    # else
    #   # self.kind = "isosceles"
    #   "isosceles"
    # end
  end

end

tri = Triangle.new(1,10,10)
# tri.valid_triangle?
# tri.assign
# p tri.kind