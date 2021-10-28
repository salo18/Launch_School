# rubocop:disable Layout/LineLength
=begin
QUESTIONS:
- I wasn't sure it was worth creating Participant subclasses. I initially wrote the code without them
  but as an exercise decided to refactor and add them in. I encountered issues convertinig the `Game#player_turn`
  and `Game#dealer_turn`, specifically with the `assign_card_to_participant` method. When I put this method in the
  Participant super class, I had to reference a deck object. I remember reading something in the course about not having
  dependencies among all classes. Right now, I have the Game depending on the Participant and Deck classes. Participant and Deck are
  not dependent on each other. If I were to implement this change, Participant would have a dependency from Deck and I thought
  that might be problematic? Am I making something out of nothing or are my instincts correct here?

- Is is a bad design practice to keep track of points in an instance method instead of an instance variable?
  Points method was easier for me to implemennt than refactoring with an instance variable @points

RUBOCOP:
- 34 - Metrics/PerceivedComplexity - ignoring
- 119 - disabled cops on Game#play since this is the main game method
- 178 - 2 Metrics cops - ignoring
- 201 - Metrics/ABCSize - ignoring
=end
# rubocop:enable Layout/LineLength

require 'pry'

class Participant
  attr_accessor :hand

  def initialize
    @hand = []
  end

  FACE_CARDS = ["J", "Q", "K"]

  def points
    tracker = 0
    hand.each do |value|
      if (2..10).include?(value)
        tracker += value
      # elsif value == "J" || value == "Q" || value == "K"
      elsif FACE_CARDS.include?(value)
        tracker += 10
      elsif value == "A"
        if tracker > 21 || (tracker + 11) > 21
          tracker += 1
        else
          tracker += 11
        end
      end
    end
    tracker
  end

  def display_hand
    case @hand.size
    when 2 then "#{@hand[0]} and #{@hand[1]}"
    else
      new_arr = @hand.map { |v| v }
      new_arr[-1] = "and #{@hand[-1]}"
      new_arr.join(", ")
    end
  end

  def bust?
    points > 21
  end

  def reset
    @hand = []
    @total_points = 0
  end
end

class Player < Participant
  def display_bust
    puts "Player busted with #{points}. Dealer wins!" if bust?
  end
end

class Dealer < Participant
  def display_bust
    puts "Dealer busted with #{points}. Player wins!" if bust?
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    reset
  end

  def reset
    @cards = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6,
              7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, "J", "J",
              "J", "J", "Q", "Q", "Q", "Q", "K", "K", "K", "K", "A", "A",
              "A", "A"]
  end

  def pick_card
    value = @cards.sample
    index = @cards.index(value)
    @cards.delete_at(index)
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable LMetrics/AbcSize

  def play
    system 'clear'
    display_welcome_message
    loop do
      loop do
        reset
        build_starting_hand(player.hand)
        build_starting_hand(dealer.hand)
        display_initial_hand
        player_turn
        player.display_bust
        break if player.bust?
        dealer_turn
        dealer.display_bust
        break if dealer.bust?
        display_points
        display_winner
        break
      end
      break unless play_again?
    end
    display_goodbye_message
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable LMetrics/AbcSize

  private

  def display_welcome_message
    puts "Welcome to 21!"
  end

  def reset
    system 'clear'
    deck.reset
    player.reset
    dealer.reset
  end

  def display_initial_hand
    puts ""
    puts "Here are the starting hands:"
    puts "Player's hand is: #{player.display_hand}"
    # player.calculate_points
    puts "Player points: #{player.points}"
    # binding.pry
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
    answer = nil
    loop do
      puts "Would you like to hit or stay? (H/S)"

      loop do
        answer = gets.chomp.downcase
        break if ["h", "s"].include?(answer)
        puts "Oops! That's not a valid input. Choose H or S."
      end

      if answer == "h"
        assign_card_to_participant(player.hand)
        puts "Player drew #{player.hand.last}"
      end

      break if answer == "s" || player.bust?
      puts "Player hand is now: #{player.display_hand}"
      puts "Player has #{player.points} points"
    end
  end

  def dealer_turn
    puts "Dealer's turn..."
    puts "Dealer has #{dealer.display_hand}."
    loop do
      if dealer.points >= 17
        puts "Dealer stays." if !dealer.bust?
        break
      end
      assign_card_to_participant(dealer.hand)
      puts "Dealer drew #{dealer.hand.last}"
    end
  end

  def display_points
    puts "Time to compare cards..."
    puts "Player has #{player.display_hand} = #{player.points} points"
    puts "Dealer has #{dealer.display_hand} = #{dealer.points} points"
  end

  def display_winner
    if player.points > dealer.points
      puts "Player wins!"
    elsif player.points < dealer.points
      puts "Dealer wins!"
    else
      puts "Tie game!"
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "That's not a valid input... Choose Y or N."
    end
    return true if answer == "y"
    return false if answer == "n"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end
end

game = Game.new
game.play

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
