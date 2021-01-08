# pseudocode for bonus section:
# need to keep score of computer/player wins
# loop only asks to replay once someone wins five games
# need to keep track of winner and loser of each match
# need to somehow know who won the game??

VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]

cpu_win = 0
player_win = 0

def display_winner(player, computer, player_win, cpu_win)
  if (player == "scissors" && computer == "paper") ||
     (player == "paper" && computer == "rock") ||
     (player == "rock" && computer == "lizard") ||
     (player == "lizard" && computer == "spock") ||
     (player == "spock" && computer == "scissors") ||
     (player == "scissors" && computer == "lizard") ||
     (player == "lizard" && computer == "paper") ||
     (player == "paper" && computer == "spock") ||
     (player == "spock" && computer == "rock") ||
     (player == "rock" && computer == "scissors")
    puts "You win!"
    player_win + 1
  elsif (computer == "scissors" && player == "paper") ||
        (computer == "paper" && player == "rock") ||
        (computer == "rock" && player == "lizard") ||
        (computer == "lizard" && player == "spock") ||
        (computer == "spock" && player == "scissors") ||
        (computer == "scissors" && player == "lizard") ||
        (computer == "lizard" && player == "paper") ||
        (computer == "paper" && player == "spock") ||
        (computer == "spock" && player == "rock") ||
        (computer == "rock" && player == "scissors")
    puts "You lose!"
    cpu_win + 1
  else
    puts "You tied. Try again."
  end
end

# def win_counter(comp_win, play_win)

# end

choice = ""
loop do # mainloop
  loop do
    puts "Choose one: #{VALID_CHOICES.join(", ")}"
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice)
      puts "You chose #{choice}."
      break
    else
      puts "That is not a valid choice. Try again."
    end
  end

  cpu_choice = VALID_CHOICES.sample
  puts "The computer chose #{cpu_choice}"

  display_winner(choice, cpu_choice)

  puts "The score is #{player_win} (you) to #{cpu_win} (computer). First to five wins!"

  puts "Want to play again? Type Y for yes."
  play = gets.chomp.downcase
  break if play != "y"
end


