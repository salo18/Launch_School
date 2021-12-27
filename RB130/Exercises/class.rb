require 'minitest/autorun'
# require_relative 'sample2'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

class TextTest < Minitest::Test
  def setup
    # @atext = Text.new('swap e')
    @file = File.open('sample2.txt', 'r')
  end

  # def test_swap
  #   text = Text.new(@file.read)
  #   actual = text.swap('a', 'e')
  #   expected = <<~TEXT.chomp
  #   Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
  #   Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
  #   quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
  #   nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
  #   dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
  #   et verius meuris, et pheretre mi.
  #   TEXT

  #   assert_equal expected, actual
  #   # assert_equal(@atext.swap('a', 'e') ,'swep a')
  # end

  def test_word_count
    # actual = @atext.word_count
    actual = Text.new(@file.read)
    assert_equal 72, actual.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"

  end
end
