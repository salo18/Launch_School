=begin
BeerSong class
  - instance variable @bottles that keeps track of the verse count
  - #verses instance method that takes 1 or 2 arguments
    - 1 argument - prints out the verse for that bottle
    - 2 arguments - prints out the verse for bottle X to Y
  - #lyrics class method that returns the entire song
  - song is the same for 99 - 2 bottles
    - changes at 1 and 0 bottles
=end

class BeerSong
  attr_accessor :num
  def self.verse(num)

    if (3..99).include?(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n" \
    elsif num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" \
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def self.verses(num1, num2)
    @num = num1

    ((num1-num2) + 1).times do |n|
        if @num == 1
         p  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
          "Take it down and pass it around, no more bottles of beer on the wall.\n" \
          "\n\n"
        elsif @num == 0
          p "No more bottles of beer on the wall, no more bottles of beer.\n" \
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
        elsif @num == 2
          p "2 bottles of beer on the wall, 2 bottles of beer.\n" \
            "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
            "\n"
        elsif (3..99).include?(@num)
         p  "#{@num} bottles of beer on the wall, #{@num} bottles of beer.\n" \
          "Take one down and pass it around, #{@num-1} bottles of beer on the wall.\n"
          "\n"
        end
        @num -= 1
      end
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end
end

BeerSong.verses(99, 98)