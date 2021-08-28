=begin
# Array:
- all? and any?
  - return true or false
- count
  - returns an integer
  - takes the array element as an argument (string, integer, etc)
- delete(object - int, str, etc)
  - returns deleted object
  - mutates the caller
- delete_at(index)
  - returns deleted object
  - deletes the object at a certain index
  - mutates the caller
- delete_if {block}
  - deletes array elements if they match the condition in the block
  - mutates the caller
  - returns the elements that remain in the array
- empty?
  - returns true if array is empty
- index(object)
  - returns the index where object is OR nil if doesn't exist
- insert(index, objects)
  - returns the entire array
  - inserts objects (separated by comma) into the array at index
- intersection(other arrays)
  - checks if other arrays are in array
  - return value is the array elements that are present in all arrays
  # [0, 1, 2, 3].intersection([0, 1, 2], [0, 1, 3]) ## => [0, 1]
- max/min
  - with no argument, returns the highest/lowest values in the array
  - with an argument(integer), returns the X number of highest/lowest values
  # [0, 1, 2, 3].max(3) # => [3, 2, 1]
- minmax returns minimum and maximum values
  # [0, 1, 2].minmax # => [0, 2]
- none? returns true or false
  - if no block given, returns true if no truthy elements
  - if a block is given, returns true if no truthy value is returned by the block
- one? -- the same as one but if one element in the array is truthy or the block returns a truthy value
- permutation
  - a = [0, 1, 2]
  - a.permutation(2) {|permutation| p permutation }
- pop
  - removes and returns the last object in the array
  - mutates the caller
- push
  - appends elements to array
  - mutates the caller
- shift
  - removes and returns leading elements
  - mutates the caller
- sort_by!
  - sorts according to block condition
  - mutates the caller
- unshift
  - prepends values to array
  - mutates the caller

# Enumerable:
- each with object
  - (1..10).each_with_object([]) { |i, a| a << i*2 }
  - iterates and returns a new array with the return value of the block as array elements
- partition
  - returns 2 arrays (first array contains array elements for which block returns true)
  # (1..6).partition { |v| v.even? }  #=> [[2, 4, 6], [1, 3, 5]]

# Hash:
- any?
  - same as array
- delete(key)
  - deletes key value pair
  - mutates the caller
- has_key?(key) (same as include? but only works on keys)
  - returns true or false
- has_value?(value)
  - returns true or false
- keep_if(block - takes k, v as parameter)
  - returns updated array
  - mutates the caller
- key(value)
  - returns the key at a certain value
- keys
  - returns a new array containing all hash keys
- shift
  - removes the first k v pair
- values
  - returns an array of hash values
- values_at(keys - can be multiple separated by a comma)
  - returns a new array containing values at the given keys

# String
- delete("chars")
  - returns a new string without argument
- delete!("chars")
  - returns same string (mutates the caller)
- delete_prefix / delete_prefix! / delete_suffix / delete_suffix!
  - "hello".delete_prefix("hel") => "lo"
- empty?
  - returns true if str == ""
- split(pattern)
  - splits string into an array based on the pattern
- squeeze / squeeze!
  - removes duplicate characters in a string
  - returns a new string with removed chars
- start_with?
  - returns true or false
- strip / strip!
  - removes leading and trailing spaces but not spaces in between
- swapcase / swapcase!
  - switches capitalization for each character

# Numeric
- abs
  - returns the absolute value of a number
- divmod
  - returns an array containing the quotient and modulo
  - 11.divmod(3) => [3, 2]
- negative? / positive?
  - return true or false if the number is < or > than 0

# Integer
- even? / odd?
  - return true or false if the number is even or odd
- times
  - runs a block x amount of times
    # 5.times {|i| print i, " " }   #=> 0 1 2 3 4
- upto(n) / downto(n)
  - run a block from x to ...
    # 5.upto(10) {|i| print i, " " }   #=> 5 6 7 8 9 10
- digits
  - converts digits into an array of numbers
  - 12345.digits      #=> [5, 4, 3, 2, 1]

=end




def substring(str)
  arr = str.chars
  result = []
  index = 0

  loop do
    arr.each_with_index do |letter, idx|
      result << arr[index..idx].join
    end
    index += 1
    break if index == arr.size
  end
  result
end

p substring("abcdef")


