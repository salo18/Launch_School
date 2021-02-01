question = 'How many times does a particular character appear in this sentence?'
# select_letter(question, 'a') # => "aaaaaaaa"
# select_letter(question, 't') # => "ttttt"
# select_letter(question, 'z') # => ""

def select_letter(q, letter)
  counter = 0
  newq = ""
  current_letter = ""

  loop do
    break if counter == q.size
    current_letter = q[counter]

    if current_letter == letter
      newq << current_letter
    end

    counter += 1
  end


  if newq.empty?
    p "#{letter} does not appear in the question"
  else
    p "#{newq.split("").first} appears in the question #{newq.size} times"
  end

end

select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""

"hello".each do |letter|
  puts letter
end