# QUESTIONS:
# 1) how to reinitialize deck value, player hand and dealer hand without redefining constant
#    and redefining the variables at the beginning of the loop?

# 2) how to use variable in a method? needed help with dealer_hit_or_stay

# require 'pry'
JACK = "Jack"
QUEEN = "Queen"
KING = "King"
ACE = "Ace"
WIN_NUMBER = 21
STAY_NUMBER = 17

DECK = ['2', '2', '2', '2', '3', '3', '3', '3', '4', '4', '4', '4', '5', '5', '5', '5'] +
       ['6', '6', '6', '6', '7', '7', '7', '7', '8', '8', '8', '8', '9', '9', '9', '9'] +
       ['10', '10', '10', '10', JACK, JACK, JACK, JACK, QUEEN] +
       [QUEEN, QUEEN, QUEEN, KING, KING, KING, KING, ACE, ACE, ACE, ACE]


player_hand = []
dealer_hand = []

def deal_card(arr)
  num = arr.sample
  arr.delete_at(arr.rindex(num) || arr.length ) #this takes the card out of the deck
  # after dealing it to player
end

player_hand = [deal_card(DECK), deal_card(DECK)]
dealer_hand = [deal_card(DECK), deal_card(DECK)]

def prompt(msg)
  puts "=> #{msg}"
end

def hand_value(arr)
  sum = 0
  arr.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  arr.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end


def display_player_hand(arr)
  if arr.size == 2
    puts "You have: #{arr[0]} and #{arr[1]}. Total is #{hand_value(arr)}"
  elsif arr.size == 3
    puts "You have: #{arr[0]}, #{arr[1]} and #{arr[2]}. Total is #{hand_value(arr)}"
  elsif arr.size == 4
    puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]} and #{arr[3]}. Total is #{hand_value(arr)}"
  elsif arr.size == 5
    puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]} and #{arr[4]}. Total is #{hand_value(arr)}"
  elsif arr.size == 6
    puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]} and #{arr[5]}. Total is #{hand_value(arr)}"
  elsif arr.size == 7
    puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]}, #{arr[5]} and #{arr[6]}. Total is #{hand_value(arr)}"
  end
end

def display_dealer_hand(arr)
  if arr.size == 2
    puts "Dealer has: X and #{arr[1]}."
  elsif arr.size == 3
    puts "Dealer has: X, #{arr[1]} and #{arr[2]}."
  elsif arr.size == 4
    puts "Dealer has: X, #{arr[1]}, #{arr[2]} and #{arr[3]}."
  elsif arr.size == 5
    puts "Dealer has: X, #{arr[1]}, #{arr[2]}, #{arr[3]} and #{arr[4]}."
  elsif arr.size == 6
    puts "Dealer has: X, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]} and #{arr[5]}."
  elsif arr.size == 7
    puts "Dealer has: X, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]}, #{arr[5]} and #{arr[6]}."
  end
end

def reveal_dealer_hand(arr)
  if arr.size == 2
    puts "Dealer has: #{arr[0]} and #{arr[1]}. Total is #{hand_value(arr)}"
  elsif arr.size == 3
    puts "Dealer has: #{arr[0]}, #{arr[1]} and #{arr[2]}. Total is #{hand_value(arr)}"
  elsif arr.size == 4
    puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]} and #{arr[3]}. Total is #{hand_value(arr)}"
  elsif arr.size == 5
    puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]} and #{arr[4]}. Total is #{hand_value(arr)}"
  elsif arr.size == 6
    puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]} and #{arr[5]}. Total is #{hand_value(arr)}"
  elsif arr.size == 7
    puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]}, #{arr[5]} and #{arr[6]}. Total is #{hand_value(arr)}"
  end
end

def player_busted(arr)
  if arr.sum > 21
    prompt("Busted! You lose!")
  end
end

def dealer_busted(arr)
  if arr.sum > 21
    prompt("The dealer busted! You win!")
  end
end

def dealer_hit_or_stay(arr)
  if arr.sum <= 17
    dealer_hand.push(deal_card(DECK)) #couldn't figure this out because of variable scope
  elsif arr.sum > 18 && arr.sum < 22
    prompt("Dealer stays. Time to reveal cards")
  elsif arr.sum > 21
    prompt("Dealer busted. You win!")
  end
end

def winner(arr1, arr2)
  # player_total = hand_value(player_hand)
  # dealer_total = hand_value(dealer_hand)
  # arr1 is player
  # arr2 is dealer
  if arr1 > 21
    prompt("Player busted. Dealer wins")
  elsif arr2 > 21
    prompt("Dealer busted. Player wins")
  elsif arr1 > arr2 && arr1 <= 21
    prompt("Player wins.")
  elsif arr2 > arr1 && arr2 <= 21
    prompt("Dealer wins.")
  end
end

# START:
loop do
  prompt("Welcome to 21!")
  player_busted = false

  loop do
    display_player_hand(player_hand)
    display_dealer_hand(dealer_hand)
    p DECK
    prompt("Hit or stay? Type H for hit and S for stay.")
    answer = gets.chomp.downcase
    if answer == "h"
      player_hand.push(deal_card(DECK))
      prompt("Your card is: #{player_hand.last}")

      if hand_value(player_hand) > 21
        # prompt("Busted! You lose!")
        display_player_hand(player_hand)
        player_busted = true
      end
    elsif answer == "s"
      break
    else
      prompt("That's not a valid answer. Type H or S")
    end
    # break if player_busted(player_hand) || dealer_busted(dealer_hand)
    break if hand_value(player_hand) > 21 || hand_value(dealer_hand) > 21 || hand_value(player_hand) == 21
  end

  if player_busted == false && hand_value(player_hand) > 21
    prompt("Player has elected to Stay. Now it's the dealer's turn.")
    loop do
      display_player_hand(player_hand)
      display_dealer_hand(dealer_hand)
      prompt("Dealer's turn.")
      # p DECK

      if hand_value(dealer_hand) <= 17
        dealer_hand.push(deal_card(DECK))
        prompt("Dealer's card is #{dealer_hand.last}.")
      elsif hand_value(dealer_hand) > 18 && hand_value(dealer_hand) < 22
        prompt("Dealer stays.")
        dealer_stays = true
      elsif hand_value(dealer_hand) > 21
        prompt("Dealer busted. You win!")
        display_dealer_hand(dealer_hand)
      end
    break if hand_value(dealer_hand) > 21 || dealer_stays
    end
  end

  prompt("Game over. Time to reveal cards")
  display_player_hand(player_hand)
  reveal_dealer_hand(dealer_hand)

  winner(hand_value(player_hand), hand_value(dealer_hand))

  prompt "Play again? (Y or N)"
  play_again = gets.chomp
  break unless play_again.downcase.start_with?("y")
  DECK = ['2', '2', '2', '2', '3', '3', '3', '3', '4', '4', '4', '4', '5', '5', '5', '5'] +
         ['6', '6', '6', '6', '7', '7', '7', '7', '8', '8', '8', '8', '9', '9', '9', '9'] +
         ['10', '10', '10', '10', JACK, JACK, JACK, JACK, QUEEN] +
         [QUEEN, QUEEN, QUEEN, KING, KING, KING, KING, ACE, ACE, ACE, ACE]
  player_hand = [deal_card(DECK), deal_card(DECK)]
  dealer_hand = [deal_card(DECK), deal_card(DECK)]
end






----------------------------
# require 'pry'
# JACK = "Jack"
# QUEEN = "Queen"
# KING = "King"
# ACE = "Ace"

# DECK = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7] +
#        [8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, JACK, JACK, JACK, JACK, QUEEN] +
#        [QUEEN, QUEEN, QUEEN, KING, KING, KING, KING, ACE, ACE, ACE, ACE]


# player_hand = []
# dealer_hand = []

# def deal_card(arr)
#   num = arr.sample
#   arr.delete_at(arr.rindex(num) || arr.length ) #this takes the card out of the deck
#   # after dealing it to player
# end

# player_hand = [deal_card(DECK), deal_card(DECK)]
# dealer_hand = [deal_card(DECK), deal_card(DECK)]

# def prompt(msg)
#   puts "=> #{msg}"
# end

# def display_player_hand(arr)
#   if arr.size == 2
#     puts "You have: #{arr[0]} and #{arr[1]}. Total is #{arr.sum}"
#   elsif arr.size == 3
#     puts "You have: #{arr[0]}, #{arr[1]} and #{arr[2]}. Total is #{arr.sum}"
#   elsif arr.size == 4
#     puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]} and #{arr[3]}. Total is #{arr.sum}"
#   elsif arr.size == 5
#     puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]} and #{arr[4]}. Total is #{arr.sum}"
#   elsif arr.size == 6
#     puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]} and #{arr[5]}. Total is #{arr.sum}"
#   elsif arr.size == 7
#     puts "You have: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]}, #{arr[5]} and #{arr[6]}. Total is #{arr.sum}"
#   end
# end

# def display_dealer_hand(arr)
#   if arr.size == 2
#     puts "Dealer has: X and #{arr[1]}."
#   elsif arr.size == 3
#     puts "Dealer has: X, #{arr[1]} and #{arr[2]}."
#   elsif arr.size == 4
#     puts "Dealer has: X, #{arr[1]}, #{arr[2]} and #{arr[3]}."
#   elsif arr.size == 5
#     puts "Dealer has: X, #{arr[1]}, #{arr[2]}, #{arr[3]} and #{arr[4]}."
#   elsif arr.size == 6
#     puts "Dealer has: X, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]} and #{arr[5]}."
#   elsif arr.size == 7
#     puts "Dealer has: X, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]}, #{arr[5]} and #{arr[6]}."
#   end
# end

# def reveal_dealer_hand(arr)
#   if arr.size == 2
#     puts "Dealer has: #{arr[0]} and #{arr[1]}. Total is #{arr.sum}"
#   elsif arr.size == 3
#     puts "Dealer has: #{arr[0]}, #{arr[1]} and #{arr[2]}. Total is #{arr.sum}"
#   elsif arr.size == 4
#     puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]} and #{arr[3]}. Total is #{arr.sum}"
#   elsif arr.size == 5
#     puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]} and #{arr[4]}. Total is #{arr.sum}"
#   elsif arr.size == 6
#     puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]} and #{arr[5]}. Total is #{arr.sum}"
#   elsif arr.size == 7
#     puts "Dealer has: #{arr[0]}, #{arr[1]}, #{arr[2]}, #{arr[3]}, #{arr[4]}, #{arr[5]} and #{arr[6]}. Total is #{arr.sum}"
#   end
# end

# def player_busted(arr)
#   if arr.sum > 21
#     prompt("Busted! You lose!")
#   end
# end

# def dealer_busted(arr)
#   if arr.sum > 21
#     prompt("The dealer busted! You win!")
#   end
# end

# def dealer_hit_or_stay(arr)
#   if arr.sum <= 17
#     dealer_hand.push(deal_card(DECK)) #couldn't figure this out because of variable scope
#   elsif arr.sum > 18 && arr.sum < 22
#     prompt("Dealer stays. Time to reveal cards")
#   elsif arr.sum > 21
#     prompt("Dealer busted. You win!")
#   end
# end

# def winner(arr1, arr2)
#   # arr1 is player
#   # arr2 is dealer
#   if arr1.sum > 21
#     prompt("Player busted. Dealer wins")
#   elsif arr2.sum > 21
#     prompt("Dealer busted. Player wins")
#   elsif arr1.sum > arr2.sum && arr1.sum <= 21
#     prompt("Player wins.")
#   elsif arr2.sum > arr1.sum && arr2.sum <= 21
#     prompt("Dealer wins.")
#   end
# end

# # START:
# loop do
#   prompt("Welcome to 21!")
#   player_busted = false

#   loop do
#     display_player_hand(player_hand)
#     display_dealer_hand(dealer_hand)
#     p DECK
#     prompt("Hit or stay? Type H for hit and S for stay.")
#     answer = gets.chomp.downcase
#     if answer == "h"
#       player_hand.push(deal_card(DECK))
#       prompt("Your card is: #{player_hand.last}")

#       if player_hand.sum > 21
#         # prompt("Busted! You lose!")
#         display_player_hand(player_hand)
#         player_busted = true
#       end
#     elsif answer == "s"
#       break
#     else
#       prompt("That's not a valid answer. Type H or S")
#     end
#     # break if player_busted(player_hand) || dealer_busted(dealer_hand)
#     break if player_hand.sum > 21 || dealer_hand.sum > 21 || player_hand.sum == 21
#   end

#   if player_busted == false && player_hand != 21
#     prompt("Player has elected to Stay. Now it's the dealer's turn.")
#     loop do
#       display_player_hand(player_hand)
#       display_dealer_hand(dealer_hand)
#       prompt("Dealer's turn.")
#       # p DECK

#       if dealer_hand.sum <= 17
#         dealer_hand.push(deal_card(DECK))
#         prompt("Dealer's card is #{dealer_hand.last}.")
#       elsif dealer_hand.sum > 18 && dealer_hand.sum < 22
#         prompt("Dealer stays.")
#         dealer_stays = true
#       elsif dealer_hand.sum > 21
#         prompt("Dealer busted. You win!")
#         display_dealer_hand(dealer_hand)
#       end
#     break if dealer_hand.sum > 21 || dealer_stays
#     end
#   end

#   prompt("Game over. Time to reveal cards")
#   display_player_hand(player_hand)
#   reveal_dealer_hand(dealer_hand)

#   winner(player_hand, dealer_hand)

#   prompt "Play again? (Y or N)"
#   play_again = gets.chomp
#   break unless play_again.downcase.start_with?("y")
#   DECK = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7] +
#        [8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10]
#   player_hand = [deal_card(DECK), deal_card(DECK)]
#   dealer_hand = [deal_card(DECK), deal_card(DECK)]
# end