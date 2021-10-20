# # RPS Bonus Features
# # rubocop:disable Layout/LineLength
=begin

RUBOCOP NOTES:
- line 167 - chose to keep #display_winner as is for simplicity

FEATURE: Keep score -- first to ten points wins
  >>> added an attr_accessore :score to Player class to keep track of the score
  >>> defined new display_score instance method to display points
  >>> changed implementation of RPSGame#play so that it has two loops
  >>> inner loop checks the points method to see if either player has X amount of points
     >>> outter loop asks the player to play again and resets the score in a new implementation
         of play_again?

  ** REASONING: made score an instance variable of the Player class since it is a state for each player.
      Although I did create many methods related to keeping and resetting the score for each player so
      it may have been worth keeping track of all the score behaviors in its own class?

 FEATURE: Keep track of history of moves
  >>> added :history to the attr_accessor of Player classs
  >>> added a new instance method RPSGame#move_history that adds each move object to the empty array referenced by
      the @history instance variable
  >>> created the RPSGame.display_history instance method to output the array elements at the end of
      the game before the user is prompted to restart the game

  ** REASONING: reached for an array for this. since each Player object can have its own @history state,
      it would be easy to save each Move object after the player chooses and then output the array
      object with a Array#each_with_index call. Did not create a new class since it seemed like the
      move history was a state of each Player object and not deserviing of its own class structure

 FEATURE: Computer personalities -- give each computer character a higher chance of a certain move
  >>> in Computer.choose, gave each computer character a different probability of choosing a certain move

  ** REASONING: still used the Array#sample method but increased or decreased the number of a certain move to
      change the probabilities (i.e. --- CPU has three 'paper' and one 'scissors' choice so
      paper is the more likely outcome of the #sample method invocation)

 FEATURE: Resetting Computer player after each round
  >>> created RPSGame#reset_computer_name to run after each round. computer.name is reset and the new
      computer is introduced to the player
  ** REASONING: the player can get bored playing with the same computer round after round. After each
      round, the computer @name is reset so that new computer rules are applied to each game. The current
      implementation is not perfect since Array#sample is called on the available names. There is a chance
      the player will play against the same computer twice in a row.

 FEATURE: Add a class for each move
  >>> did not do this as it seemed like it would add more complexity to the code for no reason.
      Specifically, creating a new class for each item would complicate the Computer.choose
      method since we currently create a new Move object and pass in a value that is assigned to the
      @value instance method upon initialization. With a new class for each move, choose would need to
      pick a random value from different classes instead of from the same class. I am not sure how I would
      implement this.
=end
# rubocop:enable Layout/LineLength

class Player
  attr_accessor :move, :name, :history, :score

  def initialize
    set_name
    @history = []
    @score = 0
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
    case @name
    when "R2D2" # R2D2 only chooses rock
      self.move = Move.new('rock')
    when "CPU" # CPU has a higher chance of choosing paper, never chooses rock
      self.move = Move.new(['paper', 'paper', 'paper', 'scissors'].sample)
    when "Lonely Comp" # Lonely Comp has an even chance of choosing
      self.move = Move.new(['rock', 'paper', 'scissors'].sample)
    end
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
    puts "Your opponent today is #{computer.name}."
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def move_history
    human.history << human.move
    computer.history << computer.move
  end

  def display_winner
    if human.move > computer.move
      puts "ROUND WINNER: #{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "ROUND WINNER: #{computer.name} won :("
      computer.score += 1
    else
      puts "ROUND WINNER: It's a tie! No points added to either player."
    end
  end

  def display_score
    puts "------"
    puts "Point totals:"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score} "
    puts "------"
  end

  def points
    return true if (human.score == 3) || (computer.score == 3)
  end

  def display_history
    puts "Here is what each player did:"

    human.history.each_with_index do |move, idx|
      puts "#{human.name} round #{idx + 1}: #{move}"
    end

    computer.history.each_with_index do |move, idx|
      puts "#{computer.name} round #{idx + 1}: #{move}"
    end

    # resetting the history after each game
    human.history = []
    computer.history = []
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

    if answer.downcase == 'y'
      reset_computer_name
      reset_scores
      display_reset_scores
      true
    end
  end

  def reset_scores # resetting scores
    human.score = 0
    computer.score = 0
  end

  def display_reset_scores
    puts "Score has been reset:"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score} "
  end

  def reset_computer_name # resetting computer player name
    computer.name = ["R2D2", 'CPU', 'Lonely Comp'].sample
    puts "You are now playing against a new computer...
    Say hi to #{computer.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing RPS #{human.name}. Goodbye!"
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        move_history
        display_winner
        display_score
        break if points
      end
      display_history
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

