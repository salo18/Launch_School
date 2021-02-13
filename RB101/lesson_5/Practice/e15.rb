# write some code to return an array which contains only the hashes where all the
# integers are even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.map do |hsh|
  hsh.select do |k, v|
    v.all? do |num|
      num.even?
    end
  end
end

# [{}, {:b=>[2, 4, 6], :d=>[4]}, {:e=>[8], :f=>[6, 10]}]

# this solution ws close but it was too granluar and included specific k/v pairs
# that were all even. it should have totally excluded the hash unless ALL hashes were
# even

# LS answer
arr.select do |hsh|
   hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
   end
end
