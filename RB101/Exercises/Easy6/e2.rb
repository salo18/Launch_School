# Write a method that takes an array of strings, and returns an array of the same
# string values, except with the vowels (a, e, i, o, u) removed

VOWELS = %w(aeiouAEIOU)

# def remove_vowels(arr)
#   arr.delete_if do |letter|
#     letter.include?(VOWELS)
#   end
# end

# this did not work

# LS answer:
def remove_vowels(arr)
  arr.map { |string| string.delete("aeiouAEIOU") }
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']