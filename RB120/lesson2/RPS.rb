# textual description of RPS
# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# Nouns: player, move, rule
# Verbs: choose, compare

# rock, paper and scissors are all variations of move

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, enter a name."
    end
    self.name = n
  end

  def choose
    puts "Please choose rock, paper, or scissors:"
    choice = nil
    loop do
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "That's not a valid choice... try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", 'CPU', 'Lonely Comp'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hey #{human.name}! Welcome to Rock, Paper, Scissors!"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won :("
    else
      puts "It's a tie!"
    end
    # case human.move
    # when 'rock'
    #   puts "It's a tie!" if computer.move == "rock"
    #   puts "#{human.name} won!" if computer.move == "scissors"
    #   puts "#{computer.name} won :(" if computer.move == "paper"
    # when 'paper'
    #   puts "It's a tie!" if computer.move == "paper"
    #   puts "#{human.name} won!" if computer.move == "rock"
    #   puts "#{computer.name} won :(" if computer.move == "scissors"
    # when 'scissors'
    #   puts "It's a tie!" if computer.move == "scissors"
    #   puts "#{human.name} won!" if computer.move == "paper"
    #   puts "#{computer.name} won :(" if computer.move == "scissors"
    # end
  end

  def display_goodbye_message
    puts "Thanks for playing RPS #{human.name}. Goodbye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? y/n"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be a Y or N"
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
