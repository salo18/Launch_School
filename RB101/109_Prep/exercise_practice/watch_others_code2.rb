=begin
You have to create a method that takes a positive integer number and returns the
next bigger number formed by the same digits:

12 ==> 21
513 ==> 531
2017 ==> 2071
If no bigger number can be composed using those digits, return -1:
9 ==> -1
111 ==> -1
531 ==> -1

Problem: need to create the next biggest number

Input: an integer
Output: the next largest integer or -1

Implicit / Explicit requirements:
- next biggest number is the last two digits flipped if the last digit is greater than 2nd to last
- if last number is >= previous numbers, return -1

Algorithm
- compare the last two numbers
  - if the last is greater than second to last, flip
  - assign this new number to a variable
  - compare the input number to variable
  - if input number is still greater, do this again
    - if at the end of the loop, the variable is still smaller than the input number, return -1


- create a substring style array that contains all permutations of the number
- locate the index of the input number
- return the number at index + 1 of that substring array
=end

def next_bigger_num(num)
  arr = num.to_s.chars.map(&:to_i)

  permutations = arr.permutation(arr.size).to_a.map {|a| a.join.to_i}.sort

  index = permutations.index(num)

  if permutations[index+1] == num || permutations[index+1] == nil
    return -1
  else
    permutations[index+1]
  end
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(231) == 312
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(987654123) == 987654132


# incorrect
  # if arr.size == 1
  #   return -1
  # end

  # if arr[-1] > arr[-2]
  #   last = arr[-1]
  #   second_last = arr[-2]
  #   arr[-2] = last
  #   arr[-1] = second_last
  #   arr.join.to_i
  # else
  #   return -1
  # end

=begin
def next_bigger_num(num)
  arr = num.to_s.chars.map(&:to_i)
  # inner_index = 0
  # outter_index = 0
  # permutations = []
  # loop do
  #   loop do
  #     permutations << arr[inner_index..outter_index].join.to_i
  #     outter_index += 1
  #     break if outter_index == arr.size
  #   end
  #   inner_index += 1
  #   outter_index = inner_index
  #   break if inner_index == arr.size
  # end
  # permutations

  n = arr.size - 1
  first, last = arr[-n, n]
  remainder = arr[0..-n]

  p first
  p last
  p remainder
  # if last > first
  #   return -1
  # else
  #   remainder << arr[n] << arr[-n]
  # end
end
=end
