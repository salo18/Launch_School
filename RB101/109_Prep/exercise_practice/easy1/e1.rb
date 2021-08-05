def repeat(str, num)

  # num.times { puts str }

  # without a method
  counter = num
  loop do
    puts str
    counter -= 1
    break if counter == 0
  end
end


repeat('Hello', 3)


