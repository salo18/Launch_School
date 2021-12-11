# SELECT

# array = [1, 2, 3, 4, 5]

# def select(arr)
#   counter = 0
#   new_arr = []
#   while counter < arr.size
#     value = yield(arr[counter])
#     new_arr.push(arr[counter]) if value #!!value == true
#     counter += 1
#   end
#   new_arr
# end

# p select(array) { |num| num.odd? }      # => [1, 3, 5] ### true or false
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false ### nil
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true ### integer -- truthiness

# REDUCE
# array = [1, 2, 3, 4, 5]

# def reduce(arr, default = 0)
#   counter = 0
#   accumulator = default
#   while counter < arr.size
#     accumulator = yield(accumulator, arr[counter])
#     counter += 1
#   end

#   accumulator
# end

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# # reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# extra reduce

# def reduce(arr, default="")
#   counter = 0
#   accumulator = default
#   while counter < arr.size
#     accumulator = yield(accumulator, arr[counter])
#     counter += 1
#   end
#   accumulator
# end

# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

def call_chunk(code_chunk)
  code_chunk.call
end
color = "blue"

say_color = Proc.new {puts "The color is #{color}"}
call_chunk(say_color)


p arr.map(&:to_s)
