# 1
# class Tree
#   include Enumerable

#   def each; end
#   def map; end
#   def select; end
#   def reduce; end

# end

# 2
# def compute
#   if block_given?
#     yield
#   else
#     "Does not compute."
#   end
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# def compute(arg)
#   block_given? ? yield(arg) : "Does not compute."
#   # if block_given?
#   #   yield(arg)
#   # else
#   #   "Does not compute."
#   # end
# end
# a = "hey"
# b = "there"
# p compute(10) { 10 } == 10
# p compute(a) { a + " there" } == 'hey there'
# p compute(a) == 'Does not compute.'

# 3
# with a block
# def missing(array)
#   full = (array[0]..array[-1]).to_a
#   new_array = full.select do |n|
#     !array.include?(n)
#   end

#   new_array
# end

# without a block
# def missing(array)
#   full = (array[0]..array[-1]).to_a
#   full - array
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# 4
# def divisors(num)
#   # select integers whose divisor is not a float
#   (1..num).select do |n|
#     # (num / n.to_f) == (num / n)
#     num % n == 0
#   end
# end

# p divisors(1) #== [1]
# p divisors(7) #== [1, 7]
# p divisors(12) #== [1, 2, 3, 4, 6, 12]
# p divisors(98) #== [1, 2, 7, 14, 49, 98]
# # p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute

# 5
  # get the index for each letter
  # need to deal with space somehow (nils)
  # add 13 to the index
  # retreive the value at that index
  # reconstruct the word

# ALEPH = ("a".."z").to_a

# def index(letter)
#   if ALEPH.include?(letter)
#     if (ALEPH.index(letter) + 13) > 25
#       ALEPH.index(letter) - 13
#     else
#       ALEPH.index(letter) + 13
#     end
#   else
#     letter
#   end
# end

# def decipher(name)
#   new_index = name.downcase.chars.map do |letter|
#     n = index(letter)
#     if ALEPH.include?(letter)
#       ALEPH.fetch(n)
#     else
#       n
#     end
#   end

#   new_index.join.split.each(&:capitalize!).join(" ")
# end

# p decipher("Nqn Ybirynpr")
# p decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
# p decipher("")
=begin
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

=end

# 6
# my solution
# def any?(array)
#   n = array.map do |n|
#     yield(n) ? true : false
#   end

#   if n.include?(true)
#     return true
#   else
#     return false
#   end
# end

# LS
# def any?(collection)
#   collection.each {|item| return true if yield(item)}
#   false
# end


# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# 7
# def all?(collection)
#   collection.each {|item| return false unless yield(item) }
#   true
# end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

# 8
# def none?(collection)
#   collection.each {|item| return false if yield(item) }
#   true
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# 9
# def one?(arr)
#   counter = []
#   arr.map do |item|
#     if counter.count(true) > 1
#       return false
#       break
#     end
#     if yield(item)
#       counter << true
#     else
#       counter << false
#     end
#   end

#   if counter.count(true) == 1
#     return true
#   else
#     return false
#   end
# end

# evaluating results at the end
# def one?(arr)
#   counter = arr.map do |item|
#     if yield(item)
#       true
#     else
#       false
#     end
#   end
#   return true if counter.count(true) == 1
#   false
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

# 10

# def count(array)
#   count = 0
#   array.each { |item| count += 1 if yield(item) }
#   count
# end

def count(collection, &block)
  collection.partition { |item| block.call(item) } [0].size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2