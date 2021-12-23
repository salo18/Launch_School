# 1
# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     record(yield) if block_given?
#   end

#   def play
#     p @recordings[-1]
#   end
# end


# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# 2
# class TextAnalyzer
#   def process
#     file = File.open("sample.txt", "r")
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }

# 3

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   # puts "#{items.join(', ')}"
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { puts items.join("! ")}

# 4
# birds = %w(raven finch hawk eagle)

# def splatty(arr)
#   yield(arr)
# end

# splatty(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(", ")}."
# end

# 5
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# # 1
# gather(items) do |*item, last|
#   # *rest, last = items
#   puts item.join(", ")
#   puts last
# end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2
# gather(items) do |first, *rest, last|
#   puts first
#   puts rest.join(", ")
#   puts last
# end
# # Let's start gathering food.
# # apples
# # corn, cabbage
# # wheat
# # We've finished gathering!

# 3
# gather(items) do |first, *rest|
#   first, *rest = items
#   puts first
#   puts rest.join(", ")
# end
# # Let's start gathering food.
# # apples
# # corn, cabbage, wheat
# # We've finished gathering!

# 4 - done
# gather(items) do |i1, i2, i3, i4|
#   puts "#{i1}, #{i2}, #{i3}, and #{i4}"
# end
# # Let's start gathering food.
# # apples, corn, cabbage, and wheat
# # We've finished gathering!

# 6 - didn't get this one..
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# base8_proc = method(:convert_to_base_8).to_proc

# [8, 10, 12, 14, 16, 33].map(&base8_proc) # => [10, 12, 14, 16, 20, 41]

# 7
=begin
algorithm:
- iterate through the array
- compare index to index + 1
- if index is smaller, do nothing
- if index is greater, switch the position
- return the new array
=end

# ORIGINAL
# def bubble_sort!(arr)
#   counter = 0
#   loop do
#     arr.size.times do |i|
#       break if i == arr.size - 1
#       if arr[i] >= arr[i+1]
#         arr[i], arr[i+1] = arr[i+1], arr[i]
#       end
#     end
#     counter += 1
#     break if counter == arr.size
#   end
#   arr
# end

# array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

def bubble_sort!(arr)
  counter = 0
  loop do
    1.upto(arr.size-1) do |i|
      if block_given?
        next if yield(arr[i-1], arr[i])
      else
        next if arr[i-1] <= arr[i]
      end
      arr[i - 1], arr[i] = arr[i], arr[i - 1]
    end
    counter += 1
    break if counter == arr.size
  end
  arr
end

# array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

array = [5, 3, 7]
p bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
p bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
p bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
p bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)