require 'pry'
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
ORDER = ["Player", "Choose", "Computer"]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  # brd is a hash -- keys correlate to space numbers
  system 'clear'
  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, punctuation = " ", word = "or")
  if arr.size == 0
    return ""
  elsif arr.size == 1
    return arr.first
  elsif arr.size == 2
    return arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(punctuation)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if empty_squares(brd).include?(5)
      square = 5
    end
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
     if brd[line[0]] == PLAYER_MARKER &&
        brd[line[1]] == PLAYER_MARKER &&
        brd[line[2]] == PLAYER_MARKER
       return "Player"
     elsif brd[line[0]] == COMPUTER_MARKER &&
           brd[line[1]] == COMPUTER_MARKER &&
           brd[line[2]] == COMPUTER_MARKER
       return "Computer"
     end
    # rubocop suggestion:
    # if brd.values_at(line[0], line[1], line[2]).count("X") == 3
    #   return "Player"
    # elsif brd.values_at(line[0], line[1], line[2]).count(O) == 3
    #   return "Computer"
    # end
  end
  nil
end

# def find_at_risk_square(brd)
#   WINNING_LINES.each do |line|
#     if (brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER)
#         brd[line[2]] == COMPUTER_MARKER
#     elsif (brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER)
#         brd[line[0]] == COMPUTER_MARKER
#     end
#   end


#   # consider an "immediate threat" to be 2 squares marked by the opponent in a row.
#   # If there's no immediate threat, then it will just pick a random square.
# end

player_score = 0
computer_score = 0

loop do
  loop do
    board = initialize_board

    prompt "NEW GAME - The score is:"
    prompt "Player: #{player_score}"
    prompt "Computer: #{computer_score}"

    order_answer = ""

    loop do
      prompt "Who should start? (If player, 'P'. If computer, 'C')"
      order_answer = gets.chomp.downcase
      # if order_answer == "p"
      #   ORDER = "Player"
      # elsif order_answer =="c"
      #   ORDER = "Computer"
      #   binding.pry
      # end
      break if order_answer == "p" || order_answer == "c"
      prompt "That's not a valid answer, try again."
    end

    loop do
      display_board(board)
# this is causing problems... 
      if order_answer == "p"
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      elsif order_answer == "c"
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    if detect_winner(board) == "Player"
      player_score += 1
    elsif detect_winner(board) == "Computer"
      computer_score += 1
    end

    prompt "The score is:"
    prompt "Player: #{player_score}"
    prompt "Computer: #{computer_score}"
    break if player_score == 5 || computer_score == 5
  end
  prompt "Play again? (Y or N)"
    answer = gets.chomp
    break unless answer.downcase.start_with?("y")
end

prompt "Thanks for playing tic tac toe. Bye!"