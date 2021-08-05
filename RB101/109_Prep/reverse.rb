# input is a string
# reverse the string

def reverse(str)
  new_str = str.chars

  reversed_str = []

  str.size.times do
    reversed_str << new_str.pop
  end

  reversed_str.join
end


p reverse("hello")


arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map do |char|
  char.upcase
end

puts arr1
puts arr2