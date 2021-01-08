# the user makes a choice
# the computer makes a choice
# the winner is displayed

# rock > scissors
# scissors > paper
# paper > rock

# MY VERSION:

def valid_choice(choice)
  choice == "rock" || choice == "paper" || choice == "scissors"
end

choice = ""
loop do # mainloop
  loop do
    puts "Choose one: rock, paper, scissors"
    choice = gets.chomp.downcase
    if valid_choice(choice)
      puts "You chose #{choice}."
      break
    else
      puts "That is not a valid choice. Try again."
    end
  end

  cpu_choice = ["rock", "paper", "scissors"].sample
  puts "The computer chose #{cpu_choice}"

  if cpu_choice == "rock" && choice == "scissors"
    puts "You lose. #{cpu_choice} beats #{choice}"
  elsif cpu_choice == "rock" && choice == "paper"
    puts "You win. #{choice} beats #{cpu_choice}"
  elsif cpu_choice == "paper" && choice == "scissors"
    puts "You win. #{choice} beats #{cpu_choice}"
  elsif cpu_choice == "paper" && choice == "rock"
    puts "You lose. #{cpu_choice} beats #{choice}"
  elsif cpu_choice == "scissors" && choice == "paper"
    puts "You lose. #{cpu_choice} beats #{choice}"
  elsif cpu_choice == "scissors" && choice == "rock"
    puts "You win. #{choice} beats #{cpu_choice}"
  elsif cpu_choice == choice
    puts "You tied. Try again."
  end

  puts "Want to play again? Type Y for yes."
  play = gets.chomp.downcase
  break if play != "y"
end

# LS VERSION:
