# 1
# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def switch_state
#     "The switch is #{switch}"
#   end

#   private

#   attr_accessor :switch
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# machine = Machine.new
# machine.start
# puts machine.switch_state

# # 2
# class FixedArray
#   def initialize(num)
#     @array = Array.new(num)
#   end

#   def [](index)
#     @array.fetch(index)
#   end

#   def []=(index, value)
#     self[index]
#     @array[index] = value
#   end


#   def to_a
#     @array.clone
#   end

#   def to_s
#     to_a.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# 3
# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = true
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#     @parking = false
#   end
# end

# 4
# class CircularQueue
#   attr_accessor :array, :size
#   def initialize(size)
#     @size = size
#     @array = Array.new(size)
#   end

#   def dequeue
#     array.shift
#   end

#   def enqueue(num)
#     if array.size == size
#       dequeue
#       array << num
#     else
#       array << num
#     end
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# 6
# class GuessingGame
#   attr_reader :num
#   attr_accessor :guesses, :user_guess

#   def initialize
#     @num = (1..100).to_a.sample
#     @guesses = 7
#     @user_guess = nil
#   end

#   def play
#     system 'clear'
#     loop do
#       display_guesses
#       get_number
#       display_result
#       # sleep(1)
#       out_of_guesses?
#       break if user_guess == num || guesses == 1
#       self.guesses -= 1
#     end
#   end

#   def display_guesses
#     puts "You have #{guesses} guesses remaining."
#   end

#   def get_number
#     puts "Enter a number between 1 and 100:"
#     answer = nil
#     loop do
#       answer = gets.chomp.to_i
#       puts "Invalid guess. Enter a number between 1 and 100:" if !(1..100).to_a.include?(answer)
#       break if (1..100).to_a.include?(answer)
#     end
#     self.user_guess = answer
#   end

#   def display_result

#     if user_guess > num
#       puts "Your guess is too high."
#     elsif num > user_guess
#       puts "Your guess is too low."
#     elsif num == user_guess
#       puts "That's the number! You win."
#     end
#   end

#   def out_of_guesses?
#     puts "Out of guesses! You lost. The number is #{num}." if guesses == 1
#   end
# end

# game = GuessingGame.new
# game.play

# 7
# class GuessingGame
#   attr_reader :num, :range
#   attr_accessor :guesses, :user_guess


#   def initialize(low, high)
#     @range = (low..high)
#     @num = (low..high).to_a.sample
#     @guesses = 7
#     @user_guess = nil
#   end

#   def play
#     system 'clear'
#     loop do
#       display_guesses
#       get_number
#       display_result
#       out_of_guesses?
#       break if user_guess == num || guesses == 1
#       self.guesses -= 1
#     end
#   end

#   def display_guesses
#     puts "You have #{guesses} guesses remaining."
#   end

#   def get_number
#     puts "Enter a number between #{range.first} and #{range.last}:"
#     answer = nil
#     loop do
#       answer = gets.chomp.to_i
#       puts "Invalid guess. Enter a number between #{range.first} and #{range.last}:" if !(range).to_a.include?(answer)
#       break if (range).to_a.include?(answer)
#     end
#     self.user_guess = answer
#   end

#   def display_result

#     if user_guess > num
#       puts "Your guess is too high."
#     elsif num > user_guess
#       puts "Your guess is too low."
#     elsif num == user_guess
#       puts "That's the number! You win."
#     end
#   end

#   def out_of_guesses?
#     puts "Out of guesses! You lost. The number is #{num}." if guesses == 1
#   end
# end

# game = GuessingGame.new(500, 1000)
# game.play

# 8
# class Card
#   attr_reader :rank, :suit, :numeric_rank

#   include Comparable

#   RANKING = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#     @numeric_rank = RANKING.index(rank)
#   end

#   def <=>(other)
#     self.numeric_rank <=> other.numeric_rank
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end
# end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# 9

# class Card
#   attr_reader :rank, :suit, :numeric_rank

#   include Comparable

#   RANKING = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#     @numeric_rank = RANKING.index(rank)
#   end

#   def <=>(other)
#     self.numeric_rank <=> other.numeric_rank
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end
# end

# class Deck
#   attr_accessor :rank, :suits

#   RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   def initialize
#     reset
#   end

#   def draw
#     reset if @deck.empty?
#     @deck.pop
#   end

#   # def initialize
#   #   @rank = RANKS
#   #   @suits = SUITS
#   #   @full_deck = RANKS.product(SUITS).shuffle
#   # end

#   # def draw
#   #   @full_deck.sample
#   # end

#   def reset
#     @deck = RANKS.product(SUITS).map do |rank, suit|
#       Card.new(rank, suit)
#     end

#     @deck.shuffle!
#   end
# end


# deck = Deck.new
# deck.draw
# drawn = []
# 52.times { drawn << deck.draw }
# drawn.count { |card| card.rank == 5 } == 4
# drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# drawn != drawn2 # Almost always.
