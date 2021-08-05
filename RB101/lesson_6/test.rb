arr = [1,0,0,0,"five"]

def five(a)
  sum = 0
  a.each do |value|
    if value == "five"
      sum += 5
    else
      sum += value.to_i
    end
  end
  sum
end

def display(a)
  if a > 10
    p "a is > 10"
  else
    p "a is < 10"
  end
end

display(five(arr))















# tictactoe
# def computer_places_piece!(brd)
#   square = ""
#   WINNING_LINES.each do |line|
#       if (brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER)
#           square = line[2]
#       elsif (brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER)
#           square = line[0]
#       elsif square = empty_squares(brd).sample
#       end
#   end
#   # binding.pry
#   brd[square] = COMPUTER_MARKER
# end

# def computer_places_piece!(brd)
#   square = nil
#   WINNING_LINES.each do |line|
#     square = find_at_risk_square(line, brd)
#     break if square
#   end

#   if !square
#     square = empty_squares(brd).sample
#   end

#   brd[square] = COMPUTER_MARKER
# end


# def find_at_risk_square(brd)


#   # consider an "immediate threat" to be 2 squares marked by the opponent in a row.
#   # If there's no immediate threat, then it will just pick a random square.
# end