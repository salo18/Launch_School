# require 'minitest/autorun'
# require_relative 'easy5'

# class ScrabbleTest < Minitest::Test
#   def test_cabbage
#     s = Scrabble.new("CABBAGE")
#     assert_equal 14, s.score
#   end

#   def test_zero
#     s = Scrabble.new("")
#     assert_equal 0, s.score
#   end

#   def test_error
#     assert_raises(ArgumentError) do
#       s = Scrabble.new(1)
#     end
#   end
# end


require 'minitest/autorun'
require_relative 'easy5'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    #skip
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    #skip
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    #skip
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word 
    #skip
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    #skip
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    #skip
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    #skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    #skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end