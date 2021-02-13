# without modifying the original array, use the map method to return a new array
# identical in structure to the original but where the value of each integer is
# incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# my solution.. correct but LS had another one
arr.map do |hash|
  hash.transform_values do |v|
    v += 1
  end
end

# LS answer:
arr.map do |hsh|
  incremented_hash = {}
  hsh.each do |k, v|
    incremented_hash[k] = v + 1
  end
  incremented_hash
end