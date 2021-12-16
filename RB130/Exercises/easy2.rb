# #10 was difficult

# 1
# def step(start, stop, step)
#   counter = start
#   arr = [start]

#   step.times do |num|
#     counter += step
#     arr << counter
#   end

#   arr.each do |item|
#     yield(item)
#   end

#   stop
# end

# p step(1, 10, 3) { |value| puts "value = #{value}" }
# # value = 1
# # value = 4
# # value = 7
# # value = 10
# # return value should be the last number on the step because that is where the block will stop execution

# 2
# def zip(arr1, arr2)
#   new_arr = []
#   arr1.size.times do |counter|
#     new_arr << Array.new(2)
#     new_arr[counter][0] = arr1[counter]
#     new_arr[counter][1] = arr2[counter]
#   end
#   new_arr
# end

# LS method
# def zip(arr1, arr2)
#   new_arr = []
#   arr1.each_with_index do |obj, idx|
#     new_arr << [obj, arr2[idx]]
#   end
#   new_arr
# end

# p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]

# 3
# def map(arr)
#   new_arr = []
#   arr.each { |item| new_arr << yield(item) }
#   new_arr
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 4
# def count(*a)
#   counter = 0
#   a.each do |item|
#     counter += 1 if yield(item)
#   end
#   counter
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# 5
# def drop_while(array)
#   new_arr = []
#   array.each do |item|
#     new_arr << item if !yield(item)
#   end
#   new_arr
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } #== [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } #== [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } #== []
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } #== [5, 6]
# p drop_while([1, 3, 5, 6]) { |value| false } #== [1, 3, 5, 6]
# p drop_while([]) { |value| true } #== []

# 6
# def each_with_index(array)
#   idx = 0
#   array.each do |item|
#     yield(item, idx)
#     idx += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# # 0 -> 1
# # 1 -> 3
# # 2 -> 36
# # true

# 7
# def each_with_object(array, object)
#   array.each {|item| yield(item, object)}
#   object
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

# 8
# def max_by(arr)
#   hash = {}
#   arr.each {|item| hash[item] = yield(item)}
#   high = hash.values.sort.max
#   hash.invert[high]
# end

# LS solution
# def max_by(arr)
#   return nil if arr.empty?

#   max_element = arr.first
#   largest = yield(max_element)
#   arr[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_element = item
#     end
#   end
#   max_element
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# 9
# def each_cons(arr)
#   length = arr.size - 2
#   arr.each_with_index do |item, idx|
#     yield(item, arr[idx +1])
#     break if idx == length
#   end
#   nil
# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

# 10
# def each_cons(arr, n)
#   arr.each_index do |index|
#     break if index + n - 1 >= arr.size
#     yield(*arr[index..(index + n - 1)])
#   end
#   nil
# end


def each_cons(arr, cons)
  count = 0

  while count <= arr.size - cons
    yield(*arr[count, cons])
    count += 1
  end

  nil
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}