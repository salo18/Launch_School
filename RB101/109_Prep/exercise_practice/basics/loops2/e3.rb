process_the_loop = [true, false].sample

loop do
  if process_the_loop
    puts "the loop was processed"
  else
    puts "it wasn't processed"
  end
  break
end