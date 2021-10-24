=begin
Questions:
-- defition of custom [] method didn't make sense to me -- why is marker called on @squares[num]?
-- should :round be in the Player class or the TTTGame class? I made it
in the TTTGame class since it seemed relevant to the game play and not to a
specific player
-- can't for the life of me figure out why TTTGame#display_stats are not
being displayed when the user chooses for the computer to go first.

Rubocop offenses:
Line 190 - didn't want to jam all the main_game methods into one larger method
Line 263 - #pick_human_marker is too complex but I don't want to refactor
            just for the sake of pleasing rubocop if the method is simple but long
Line 283 - same for #pick_computer_marker... it is too complex because I added
            lots of input validation that I don't want to remove
Line 369 - #computer_moves - ignoring this cop because there are a lot of moves
            the computer to go through and I think it should stay in the same method
            for simplicity

BONUS FEATURES:
1. Allow player to pick marker
  -- defined TTTGame#pick_human_marker and TTTGame#pick_computer_marker
  -- allowed player to pick new marker after every game TTTGame#reset_markers

2. Set a name for player and computer
  -- defined TTTGame#pick_human_name and TTTGame#pick_computer_name
    >> should these methods be in the Player class?

3. Improved "join"
  -- defined TTTGame#joinor method

4. Keep score
  -- had to make new attr_accessor and instance variable for Player to represent
  the score
  -- created TTTGame#display_round and TTTGame#display_score
  -- had to add in a new loop in the main game method to make each game end
  after three points
  -- added an instance variable @round and attr_accessor to keep track of what
  round the game is on

5. Computer AI: Defense
  -- updated TTTGame#computer_moves

6. Computer AI: Offense
-- updated TTTGame#computer_moves

7. Computer turn refinements --
-- switched order of TTTGame#computer_moves -- offense first
-- added feature of picking 5 if available after defense
-- allowed the user to decide which player goes first TTTGame#ask_who_goes_first
=end
require 'pry'

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
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
  attr_accessor :name, :marker, :score

  def initialize(marker)
    @marker = marker
    @name
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer
  attr_accessor :round

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker #= FIRST_TO_MOVE
    @round = 1
  end

  def play
    clear
    game_setup
    main_game
    display_goodbye_message
  end

  private

  def game_setup
    display_welcome_message
    pick_human_name
    pick_computer_name
    pick_human_marker
    pick_computer_marker
    display_names
    press_key_to_continue
  end

  # rubocop:disable Metrics/MethodLength
  def main_game
    loop do
      loop do
        reset
        ask_who_goes_first
        display_stats
        player_move
        display_result
        press_key_to_continue
        increment_round
        break if human.score == 3 || computer.score == 3
      end
      display_score
      display_total_rounds
      break unless play_again?
      display_play_again_message
      reset_score_and_round
      reset
    end
  end
  # rubocop:enable Metrics/MethodLength

  def display_stats
    display_round
    display_score
    display_board
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  CHARS = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  def pick_human_name
    puts "What is your name?"
    player_name = nil
    loop do
      player_name = gets.chomp.to_s
      break if (CHARS).to_a.include?(player_name.chars[0])
      puts "Oops, must write your name."
    end
    human.name = player_name
  end

  def pick_computer_name
    puts ""
    puts "What is the name of the computer you will be playing against?"
    computer_name = nil
    loop do
      computer_name = gets.chomp
      break if (CHARS).to_a.include?(computer_name.chars[0])
      puts "Oops, must write a valid name."
    end
    computer.name = computer_name
  end

  def display_names
    puts ""
    puts "Welcome #{human.name}! You will be playing against #{computer.name}."

    puts ""
    puts "First to three points wins!"
  end

  def pick_human_marker
    puts ""
    puts "What would you like your marker to be? You can pick any character."
    human_marker = nil
    loop do
      human_marker = gets.chomp

      if human_marker.size != 1
        puts "Oops! Must pick a single character."
      elsif !(CHARS).to_a.include?(human_marker)
        puts "Oops! Must pick a valid character (letter or number)."
      end

      break if human_marker.size == 1 && (CHARS).to_a.include?(human_marker)
    end
    human.marker = human_marker
    puts "Success! You picked #{human.marker} as your own marker."
  end

  # rubocop:disable Layout/LineLength
  def pick_computer_marker
    puts ""
    puts "What would you like the computer's marker to be? You can pick any character."
    computer_marker = nil
    loop do
      computer_marker = gets.chomp

      if computer_marker.size != 1
        puts "Oops! Must pick a single character"
      elsif !(CHARS).to_a.include?(computer_marker)
        puts "Oops! Must pick a valid character (letter or number)."
      elsif computer_marker == human.marker
        puts "Oops! You've already picked that marker for yourself.
        Pick another one."
      end

      break if (computer_marker.size == 1) &&
               ((CHARS).to_a.include?(computer_marker)) &&
               (computer_marker != human.marker)
    end
    computer.marker = computer_marker
    puts "Success! You picked #{computer.marker} as the computer's marker."
  end
  # rubocop:enable Layout/LineLength

  def display_board
    puts ""
    puts "You are #{human.marker}. Computer is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def ask_who_goes_first
    puts ""
    puts "Who should play first? Human or computer? (H/C)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ["h", "c"].include?(answer)
      puts "That's not a valid option... Type H or C."
    end
    puts ""
    set_who_goes_first(answer)
  end

  def set_who_goes_first(answer)
    if answer == "h"
      puts "Great! #{human.name} will go first."
      @current_marker = HUMAN_MARKER
    elsif answer == "c"
      puts "Great! #{computer.name} will go first."
      @current_marker = COMPUTER_MARKER
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(arr, delimiter=", ", word="or")
    case arr.size
    when 0 then ""
    when 1 then arr[0]
    when 2 then arr.join(" #{word}")
    else
      new_arr = arr
      new_arr[-1] = "#{word} #{arr[-1]}"
      new_arr.join(delimiter)
    end
  end

  def human_moves
    puts "Choose an available square: #{joinor(board.unmarked_keys)}"
    # {board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "That's not a valid option... Choose a number 1 - 9."
    end

    board[square] = human.marker
  end

  def computer_moves
    square = nil
    # offensive
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, computer.marker)
      break if square
    end

    # defensive
    if !square
      Board::WINNING_LINES.each do |line|
        square = find_at_risk_square(line, human.marker)
        break if square
      end
    end

    # pick square 5
    if !square
      square = 5 if board.squares[5].marker == Square::INITIAL_MARKER
    end

    # random sample
    if !square
      square = board.unmarked_keys.sample
    end

    board[square] = computer.marker
  end

  # rubocop:disable Layout/LineLength
  def find_at_risk_square(line, marker)
    squares_hash = board.squares.slice(*line)
    markers = squares_hash.select { |_, v| v.marked? }.values.map(&:marker)
    if markers.count(marker) == 2
      squares_hash.select { |_, v| v.marker == Square::INITIAL_MARKER }.keys.first
      # else
      # nil
    end
  end
  # rubocop:enable Layout/LineLength

  # Board::WINNING_LINES.each do |line|
  # squares_hash = board.squares.slice(*line)
  # markers = squares_hash.select{ |_, v| v.marked? }.values.map(&:marker)
  #   if markers.count(human.marker) == 2
  #     next_key = squares_hash.select { |_, v|
  #       v.marker == Square::INITIAL_MARKER }.keys.first
  #     break if next_key
  #   elsif markers.count(computer.marker) == 2
  #     next_key = squares_hash.select { |_, v| v.marker ==
  #       Square::INITIAL_MARKER }.keys.first
  #   end

  #   if !next_key
  #     next_key = board.unmarked_keys.sample
  #   end
  # end
  # board[next_key] = computer.marker
  # end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_result
    display_board
    case board.winning_marker
    when human.marker
      puts "You win!"
      human.score += 1
    when computer.marker
      puts "Computer won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def press_key_to_continue
    puts ""
    puts "press any key to continue"
    key = gets.chomp
    loop do
      break if key
    end
  end

  def increment_round
    self.round = round + 1
  end

  def display_round
    puts ""
    puts "It's round number #{@round}."
  end

  def display_score
    puts ""
    puts "The score is:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_total_rounds
    puts ""

    if human.score == 3
      puts "After #{round} rounds, the winner is #{human.name}!"
    elsif computer.score == 3
      puts "After #{round} rounds, the winner is #{computer.name}!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts ""
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "Sorry, must be a y or n"
    end

    return false if answer == "n"
    return true if answer == "y"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe. Goodbye!"
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    # @current_marker = FIRST_TO_MOVE
    clear
  end

  def reset_score_and_round
    human.score = 0
    computer.score = 0
    self.round = 1
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  # def reset_markers
  #   pick_human_marker
  #   pick_computer_marker
  # end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
