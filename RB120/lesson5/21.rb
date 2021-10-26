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
  attr_accessor :hand #:total_points

  def initialize
    @hand = []
    # @total_points = 0
  end

  def points
    tracker = 0
    hand.each do |value|
      if (2..10).include?(value)
        tracker += value
      elsif value == "J" || value == "Q" || value == "K"
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
    @player = Participant.new
    @dealer = Participant.new
  end

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
        display_player_bust
        break if player.bust?
        dealer_turn
        display_dealer_bust
        break if dealer.bust?
        display_winner
        break
      end
      break unless play_again?
    end
    display_goodbye_message
  end

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

  def display_dealer_bust
    puts "Dealer busted with #{dealer.points}. Player wins!" if dealer.bust?
  end

  def display_player_bust
    puts "Player busted with #{player.points}. Dealer wins!" if player.bust?
  end

  def display_winner
    puts "Time to compare cards..."
    puts "Player has #{player.display_hand} = #{player.points} points"
    puts "Dealer has #{dealer.display_hand} = #{dealer.points} points"

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
