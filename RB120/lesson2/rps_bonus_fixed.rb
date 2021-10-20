# # RPS Bonus Features

class Player
  attr_accessor :move, :name, :history, :score

  def initialize
    set_name
    @history = []
    @score = 0
  end

  # def move_history
  #   human.history << human.move
  #   computer.history << computer.move
  # end

  def update_history
    history << move
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp

      break unless n.empty? || ["R2D2", 'CPU', 'Lonely Comp'].include?(n)
      puts "Sorry, enter a name (but not a computer's name - R2D2,
      CPU or Lonely Comp)."
    end
    self.name = n
  end

  def choose
    puts "Please choose rock (r), paper (p), or scissors (s):"
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice) || ['r', 'p', 's'].include?(choice)
      puts "That's not a valid choice... try again."
    end

    # if choice == "r"
    #   choice = "rock"
    # elsif choice == "p"
    #   choice = "paper"
    # elsif choice == "s"
    #   choice = "scissors"
    # end
    # self.move = Move.new(choice)

    if choice == "r" || choice == "rock"
      self.move = Rock.new
    elsif choice == "p" || choice == "paper"
      self.move = Paper.new
    elsif choice == "s" || choice == "scissors"
      self.move = Scissors.new
    end
  end
end

class Computer < Player
  # def set_name
  #   # self.name = ["R2D2", 'CPU', 'Lonely Comp'].sample
  #   self.name = [R2D2.new, CPU.new, LonelyComp.new].sample
  # end

  def initialize
    @history = []
    @score = 0
  end

# def choose
#   case @name
#   when "R2D2" # R2D2 only chooses rock
#     self.move = Move.new('rock')
#   when "CPU" # CPU has a higher chance of choosing paper, never chooses rock
#     self.move = Move.new(['paper', 'paper', 'paper', 'scissors'].sample)
#   when "Lonely Comp" # Lonely Comp has an even chance of choosing
#     self.move = Move.new(['rock', 'paper', 'scissors'].sample)
#   end
# end

#     case @name
#     when "R2D2" # R2D2 only chooses rock
#       self.move = Rock.new
#     when "CPU" # CPU has a higher chance of choosing paper, never chooses rock
#       self.move = [Paper.new, Paper.new, Paper.new, Scissors.new].sample
#     when "Lonely Comp" # Lonely Comp has an even chance of choosing
#       self.move = [Rock.new, Paper.new, Scissors.new].sample
#     end
#   end
end

class R2D2 < Computer
  def initialize
    super
    @name = "R2D2"
  end

  def choose
    @move = Rock.new
  end
end

class CPU < Computer
  def initialize
    super
    @name = "CPU"
  end

  def choose
    @move = [Paper.new, Paper.new, Paper.new, Scissors.new].sample
  end
end

class LonelyComp < Computer
  def initialize
    super
    @name = "Lonely Comp"
  end

  def choose
    @move = [Rock.new, Paper.new, Scissors.new].sample
  end
end

class Move
  # VALUES_SUBCLASS = [Rock.new, Paper.new, Scissors.new ]
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

  # def >(other_move)
  #   # (rock? && other_move.scissors?) ||
  #   #   (paper? && other_move.rock?) ||
  #   #   (scissors? && other_move.paper?)
  # end

  def >(other_move)
    @beats.include?(other_move.to_s)
  end

  # def <(other_move)
  #   (rock? && other_move.paper?) ||
  #     (paper? && other_move.scissors?) ||
  #     (scissors? && other_move.rock?)
  # end

  def <(other_move)
    @loses.include?(other_move.to_s)
  end

  def to_s
    @name
  end
end

class Rock < Move
  def initialize
    @name = 'rock'
    @beats = ['scissors']
    @loses = ['paper']
  end
end

class Paper < Move
  def initialize
    @name = 'paper'
    @beats = ['rock']
    @loses = ['scissors']
  end
end

class Scissors < Move
  def initialize
    @name = 'scissors'
    @beats = ['paper']
    @loses = ['rock']
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = [R2D2.new, CPU.new, LonelyComp.new].sample
  end

  def display_welcome_message
    puts "Hey #{human.name}! Welcome to Rock, Paper, Scissors!"
    puts "Your opponent today is #{computer.name}."
    puts "Press any key to begin."
    gets.chomp
    system "clear"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  # def move_history
  #   human.history << human.move
  #   computer.history << computer.move
  # end

  def display_winner
    if human.move > computer.move
      puts "ROUND WINNER: #{human.name} won!"
    elsif human.move < computer.move
      puts "ROUND WINNER: #{computer.name} won :("
    else
      puts "ROUND WINNER: It's a tie! No points added to either player."
    end
  end

  def increment_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "------"
    puts "Point totals:"
    puts "#{human.name} - #{human.score}"
    puts "#{computer.name} - #{computer.score} "
    puts "------"
  end

  def clear_screen
    puts "Press any key to clear the screen and begin the next round."
    gets.chomp
    system "clear"
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
  end

  def history_reset
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

    true if answer.downcase == 'y'
  end

  def reset_all
    reset_computer_name
    reset_scores
    display_reset_scores
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
      reset_all
      loop do
        [human, computer].each(&:choose) #{ |player| player.choose }
        display_moves
        [human, computer].each(:&update_history) #{ |player| player.update_history }
        # move_history
        display_winner
        increment_score
        display_score
        clear_screen
        break if points
      end
      display_history
      history_reset
      break unless play_again?
      clear_screen
    end
    display_goodbye_message
  end
end

RPSGame.new.play