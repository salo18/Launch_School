=begin
PEDAC:
- initialize deck / player and dealer objects
- display welcome messages
- display player and dealer hands
- Player turn: hit or stay
    - break if stay or bust
    - if player busts, dealer wins
- Dealer hit or stay
  - repeat until value is >= 17
  - if dealer busts, player wins
- once someone wins, compare cards
- ask player to play again?
- display goodbye message
=end

require 'pry'

class Participant
  attr_accessor :hand, :points
  def initialize
    @hand = []
    @points = 0
  end

  def points
    values = hand.map do |value|
      if (2..10).include?(value)
        value
      else
        Deck::FACE_CARDS[value]
      end
    end
    values.sum
  end

  def display_hand
    @hand.join(", ")
  end

  def bust?
    points > 21
  end
end

class Player < Participant

end

class Dealer < Participant

end

class Deck
  FACE_CARDS = {"J" => 10, "Q" => 10, "K" => 10, "A" => 10 }

  def initialize
    @cards = []
    reset
  end

  def reset
    @cards = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6,
    7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, "J", "J",
    "J", "J", "Q", "Q", "Q", "Q", "K", "K", "K", "K", "A", "A", "A", "A"]
  end

  def pick_card
    # [@cards.sample, @cards.sample]
    value = @cards.sample
    index = @cards.index(value)
    @cards.delete_at(index)
  end
end

# class Card

# end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    system 'clear'
    display_welcome_message
    loop do
      # reset -- reset scores, reset hands, etc
      build_starting_hand(player.hand)
      build_starting_hand(dealer.hand)
      display_hands
      player_turn
      break if player.bust?
=begin
if player looses, display "player lost" at this stage
=end

    #   dealer_turn
    #   # break if bust?
    #   display_winner
    #   # break if play_again?
    end
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to 21!"
  end

  def display_hands
    puts ""
    puts "Here are the starting hands:"
    puts "Player's hand is: #{player.hand[0]} and #{player.hand[1]}"
    puts "Player points: #{player.points}"
    puts "Dealer's hand is #{dealer.hand[0]} and unknown"
  end

  def assign_card_to_participant(participant)
    participant.push(deck.pick_card)
  end

  def build_starting_hand(participant)
    assign_card_to_participant(participant)
    assign_card_to_participant(participant)
  end

  def player_turn
    puts ""
    puts "Would you like to hit or stay? (H/S)"
    answer = nil
    loop do
      loop do
        answer = gets.chomp.downcase
        break if ["h", "s"].include?(answer)
        puts "Oops! That's not a valid input. Choose H or S."
      end
      assign_card_to_participant(player.hand) if answer == "h"
      puts "Player hand is now: #{player.display_hand}"
      puts "Player has #{player.points} points"
      break if answer == "s" || player.bust?
    end
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end
end

game = Game.new
game.play