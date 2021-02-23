# Write a method that takes an Array as an argument, and reverses its elements in
# place; that is, mutate the Array passed into this method. The return value should
# be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse(arr)
  l_index = 0
  r_index = -1

  while l_index < arr.size /2
    arr[l_index], arr[right_index] = arr[right_index], arr[l_index]
    l_index += 1
    r_index -= 1
  end
arr
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true