=begin
need to convert numbers into roman numerals

class RomanNumeral
  - constructor that takes an integer as an argument
  - to_roman instance method converts the integer into corresponding roman numeral

Rules:
I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1,000

Algorithm
- need to convert number into roman numeral
- 4 IV and 9 IX are special
- read number from left to right
- need to separate number into corresponding digits
    - 499 == 400, 90, 9
  > put digits into an array to be evaluated individually
- iterate through the array and build a new string that matches
the roman numerals
  -


=end

class RomanNumeral
  attr_reader :number

  def initialize(number)
    @number = number
  end

  # HASH = {(1..3) => "I", (100..399) => "C"}
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def to_roman
    # make_array.map do |el|
    #     HASH[el]
    # end

    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end

  private

  def make_array
    arr = []
    str = number.to_s

    counter = 0
    (str.size-1).downto(0) do |i|
      arr << ("#{str[counter]}#{"0" * i}")
      counter += 1
    end

    arr#.map(&:to_i)
  end
end

r = RomanNumeral.new(499)
p r.to_roman