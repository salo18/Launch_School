number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  p "5 was reached!" if (number_a == 5 || number_b == 5)

  break if (number_a == 5 || number_b == 5)
end

p number_b
p number_a