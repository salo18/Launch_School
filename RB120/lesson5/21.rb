# =begin
# PEDAC:
# - initialize deck / player and dealer objects
# - display welcome messages
# - display player and dealer hands
# - Player turn: hit or stay
#     - break if stay or bust
#     - if player busts, dealer wins
# - Dealer hit or stay
#   - repeat until value is >= 17
#   - if dealer busts, player wins
# - once someone wins, compare cards
# - ask player to play again?
# - display goodbye message

# NOTES:
# - I initially made player and dealer sublcasses of Participant but did not see a need for this
#   since they basically do the same thing but display different looping behavior which I covered
#   in the game loop. Maybe this is the wrong place to display these differencess and a class would
#   have been better? It didn't seem worth the additional complexity.
# -


# =end

# require 'pry'

# class Participant
#   attr_accessor :hand #:total_points

#   def initialize
#     @hand = []
#     # @total_points = 0
#   end

#   def points
#     tracker = 0
#     hand.each do |value|
#       if (2..10).include?(value)
#         tracker += value
#       elsif value == "J" || value == "Q" || value == "K"
#         tracker += 10
#       elsif value == "A"
#         if tracker > 21 || (tracker + 11) > 21
#           tracker += 1
#         else
#           tracker += 11
#         end
#       end
#     end
#     tracker
#   end

#   def display_hand
#     case @hand.size
#     when 2 then "#{@hand[0]} and #{@hand[1]}"
#     else
#       new_arr = @hand.map { |v| v }
#       new_arr[-1] = "and #{@hand[-1]}"
#       new_arr.join(", ")
#     end
#   end

#   def bust?
#     points > 21
#   end

#   def reset
#     @hand = []
#     @total_points = 0
#   end
# end

# class Deck
#   attr_reader :cards

#   def initialize
#     @cards = []
#     reset
#   end

#   def reset
#     @cards = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6,
#               7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, "J", "J",
#               "J", "J", "Q", "Q", "Q", "Q", "K", "K", "K", "K", "A", "A",
#               "A", "A"]
#   end

#   def pick_card
#     value = @cards.sample
#     index = @cards.index(value)
#     @cards.delete_at(index)
#   end
# end

# class Game
#   attr_accessor :player, :dealer, :deck

#   def initialize
#     @deck = Deck.new
#     @player = Participant.new
#     @dealer = Participant.new
#   end

#   def play
#     system 'clear'
#     display_welcome_message
#     loop do
#       loop do
#         reset
#         build_starting_hand(player.hand)
#         build_starting_hand(dealer.hand)
#         display_initial_hand
#         player_turn
#         display_player_bust
#         break if player.bust?
#         dealer_turn
#         display_dealer_bust
#         break if dealer.bust?
#         display_winner
#         break
#       end
#       break unless play_again?
#     end
#     display_goodbye_message
#   end

#   def display_welcome_message
#     puts "Welcome to 21!"
#   end

#   def reset
#     system 'clear'
#     deck.reset
#     player.reset
#     dealer.reset
#   end

#   def display_initial_hand
#     puts ""
#     puts "Here are the starting hands:"
#     puts "Player's hand is: #{player.display_hand}"
#     # player.calculate_points
#     puts "Player points: #{player.points}"
#     # binding.pry
#     puts "Dealer's hand is #{dealer.hand[0]} and unknown"
#   end

#   def assign_card_to_participant(participant)
#     participant.push(deck.pick_card)
#   end

#   def build_starting_hand(participant)
#     assign_card_to_participant(participant)
#     assign_card_to_participant(participant)
#   end

#   def player_turn
#     puts ""
#     answer = nil
#     loop do
#       puts "Would you like to hit or stay? (H/S)"

#       loop do
#         answer = gets.chomp.downcase
#         break if ["h", "s"].include?(answer)
#         puts "Oops! That's not a valid input. Choose H or S."
#       end

#       if answer == "h"
#         assign_card_to_participant(player.hand)
#         puts "Player drew #{player.hand.last}"
#       end

#       break if answer == "s" || player.bust?
#       puts "Player hand is now: #{player.display_hand}"
#       puts "Player has #{player.points} points"
#     end
#   end

#   def dealer_turn
#     puts "Dealer's turn..."
#     puts "Dealer has #{dealer.display_hand}."
#     loop do
#       if dealer.points >= 17
#         puts "Dealer stays." if !dealer.bust?
#         break
#       end
#       assign_card_to_participant(dealer.hand)
#       puts "Dealer drew #{dealer.hand.last}"
#     end
#   end

#   def display_dealer_bust
#     puts "Dealer busted with #{dealer.points}. Player wins!" if dealer.bust?
#   end

#   def display_player_bust
#     puts "Player busted with #{player.points}. Dealer wins!" if player.bust?
#   end

#   def display_winner
#     puts "Time to compare cards..."
#     puts "Player has #{player.display_hand} = #{player.points} points"
#     puts "Dealer has #{dealer.display_hand} = #{dealer.points} points"

#     if player.points > dealer.points
#       puts "Player wins!"
#     elsif player.points < dealer.points
#       puts "Dealer wins!"
#     else
#       puts "Tie game!"
#     end
#   end

#   def play_again?
#     puts "Would you like to play again? (y/n)"
#     answer = nil
#     loop do
#       answer = gets.chomp.downcase
#       break if ["y", "n"].include?(answer)
#       puts "That's not a valid input... Choose Y or N."
#     end
#     return true if answer == "y"
#     return false if answer == "n"
#   end

#   def display_goodbye_message
#     puts "Thanks for playing!"
#   end
# end

# game = Game.new
# game.play

# =begin
#   - make methods private?
# =end



# tictactoe.rb
module Formattable
  def clear
    system('clear')
  end

  def blank_line
    puts
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end
end

module Questionable
  include Formattable

  YES_NO_OPTIONS = %w(y yes n no)

  def ask_yes_no_question(question)
    answer = nil
    loop do
      puts question
      answer = gets.chomp.downcase.strip
      break if YES_NO_OPTIONS.include? answer
      puts "Sorry, must be y or n."
      blank_line
    end
    answer[0] == 'y'
  end

  def ask_open_question(question, void_answer)
    answer = nil
    loop do
      puts question
      answer = gets.chomp.strip
      break unless answer.empty? || answer == void_answer
      puts "Sorry, must enter a value (it can't be '#{void_answer}'!)."
      blank_line
    end
    answer
  end

  def ask_closed_question(question, options)
    downcase_options = options.map(&:downcase)
    answer = nil
    loop do
      puts question
      answer = gets.chomp.downcase.strip
      break if downcase_options.include?(answer)
      puts "Sorry, invalid choice."
      blank_line
    end
    answer
  end

  def ask_integer_choice(question, options)
    answer = nil
    loop do
      puts question
      answer = gets.chomp.strip
      break if options.include?(answer.to_i) && integer?(answer)
      puts "Sorry, that's not a valid choice, must be an integer."
      blank_line
    end
    answer.to_i
  end

  def integer?(str)
    str == str.to_i.to_s
  end
end

module Displayable
  def display_welcome_message
    clear
    puts <<~WELCOME
    Hi #{human.name}. Welcome to Tic Tac Toe!
    You are playing against #{computer.name}.
    The first to win #{TTTGame::WINS_LIMIT} games is the Champion!
    WELCOME
    blank_line
  end

  def display_result_and_scores
    display_result
    display_scores
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_scores
    puts <<~SCORES
    Remember, the first to win #{TTTGame::WINS_LIMIT} games is the Champion!
    #{human.name} has #{human.score} #{human.point_string}.
    #{computer.name} has #{computer.score} #{computer.point_string}.
    SCORES
  end

  def display_board
    clear
    puts "#{human.name} is an #{human.marker}. " \
        "#{computer.name} is an #{computer.marker}."
    blank_line
    board.draw
    blank_line
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_champion
    blank_line
    puts "#{champion} won #{TTTGame::WINS_LIMIT} games and is the CHAMPION!"
    blank_line
  end

  def play_again?
    ask_yes_no_question("Would you like to play another match? (y/n)")
  end

  def continue_match_message
    blank_line
    answer = ask_closed_question(
      "Press enter to continue the match (or 'q' to quit this match).",
      ["", "q"]
    )
    clear
    answer.empty? ? true : false
  end

  def display_rematch_message
    clear
    puts <<~REMATCH
    Hi #{human.name}. Welcome back to Tic Tac Toe!
    You are playing against #{computer.name}.
    Remember, the first to win #{TTTGame::WINS_LIMIT} games is the Champion!
    REMATCH
    blank_line
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac Toe! Goodbye!"
    blank_line
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  CENTER_SQUARE = 5

  attr_accessor :human_marker, :computer_marker

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
    @squares[num].id = " "
  end

  def [](num)
    @squares[num]
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new(key) }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "#{@squares[1].id}    |#{@squares[2].id}    |#{@squares[3].id}"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "#{@squares[4].id}    |#{@squares[5].id}    |#{@squares[6].id}"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "#{@squares[7].id}    |#{@squares[8].id}    |#{@squares[9].id}"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def find_best_square
    computer_offense_move || computer_defense_move || basic_move
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end

  def computer_offense_move
    find_potential_winning_move(computer_marker)
  end

  def computer_defense_move
    find_potential_winning_move(human_marker)
  end

  def find_potential_winning_move(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      square = find_at_risk_square(squares, marker)
      return square if square
    end
    nil
  end

  def find_at_risk_square(squares, marker_type)
    markers = squares.select(&:marked?).map(&:marker)
    if markers.count(marker_type) == 2 && empty_square(squares)
      return empty_square(squares)
    end
    nil
  end

  def empty_square(squares)
    squares.select(&:unmarked?).first
  end

  def basic_move
    if self[CENTER_SQUARE].unmarked?
      self[CENTER_SQUARE]
    else
      self[unmarked_keys.sample]
    end
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :id, :marker

  def initialize(id, marker = INITIAL_MARKER)
    @id = id
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  include Questionable

  COMPUTER_NAME = "Joshua"

  attr_reader :name
  attr_accessor :score, :marker

  def initialize
    @score = 0
  end

  def increment_score
    self.score += 1
  end

  def point_string
    score == 1 ? "point" : "points"
  end
end

class Human < Player
  def initialize
    @name = ask_open_question("What's your name?", COMPUTER_NAME)
    super
  end

  def assign_marker
    self.marker = case choose_marker
                  when TTTGame::DEF_MARK.downcase
                    TTTGame::DEF_MARK
                  when TTTGame::ALT_MARK.downcase
                    TTTGame::ALT_MARK
                  else
                    [TTTGame::DEF_MARK, TTTGame::ALT_MARK].sample
                  end
  end

  def choose_marker
    puts "#{TTTGame::DEF_MARK} goes first. "
    question = "Would you like to be '#{TTTGame::DEF_MARK}' " \
      "or '#{TTTGame::ALT_MARK}'? (Press enter for random choice.)"

    ask_closed_question(
      question, [TTTGame::DEF_MARK, TTTGame::ALT_MARK, ""]
    )
  end

  def ask_move(unmarked_keys)
    ask_integer_choice(
      "Choose a square (#{joinor(unmarked_keys.dup)}):",
      unmarked_keys
    )
  end
end

class Computer < Player
  def initialize
    @name = COMPUTER_NAME
    super
  end
end

class TTTGame
  include Questionable
  include Displayable

  DEF_MARK = 'X'
  ALT_MARK = 'O'
  WINS_LIMIT = 5

  attr_reader :board, :human, :computer
  attr_accessor :champion, :current_marker

  def initialize
    clear
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_marker = DEF_MARK # This sets which marker moves first
  end

  def play
    clear
    display_welcome_message
    loop do
      main_game
      display_champion if champion
      break unless play_again?
      reset_match
      display_rematch_message
    end
    display_goodbye_message
  end

  private

  def main_game
    loop do
      determine_player_markers
      display_board
      player_moves
      update_score
      display_result_and_scores
      break if match_winner
      reset_board
      break unless continue_match_message
    end
  end

  def determine_player_markers
    human.assign_marker
    computer.marker = determine_computer_marker
    board.human_marker = human.marker
    board.computer_marker = computer.marker
  end

  def determine_computer_marker
    human.marker == DEF_MARK ? ALT_MARK : DEF_MARK
  end

  def player_moves
    loop do
      current_player_move
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_move
    square_key = choose_move_square
    board[square_key] = current_marker
    self.current_marker = toggle_current_player
  end

  def choose_move_square
    if human_turn?
      human.ask_move(board.unmarked_keys)
    else
      board.find_best_square.id
    end
  end

  def human_turn?
    current_marker == human.marker
  end

  def toggle_current_player
    if current_marker == human.marker
      computer.marker
    else
      human.marker
    end
  end

  def update_score
    case board.winning_marker
    when human.marker
      human.increment_score
    when computer.marker
      computer.increment_score
    end
  end

  def match_winner
    self.champion = if human.score == WINS_LIMIT
                      human.name
                    elsif computer.score == WINS_LIMIT
                      computer.name
                    end
  end

  def reset_board
    board.reset
    @current_marker = DEF_MARK
  end

  def reset_match
    reset_board
    human.score = 0
    computer.score = 0
    self.champion = nil
  end
end

game = TTTGame.new
game.play

