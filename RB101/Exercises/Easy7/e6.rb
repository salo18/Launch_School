# Modify the method from the previous exercise so it ignores non-alphabetic characters
# when determining whether it should uppercase or lowercase each letter. The
# non-alphabetic characters should still be included in the return value; they just
# don't count when toggling the desired case.

require 'pry'

ALEPH = [*'a'..'z', *'A'..'Z']

def staggered_case(str)
  final = []
  new_str = str.chars
  index = 0

  # loop do
  #   if ALEPH.include?(new_str[index]) && index.even?
  #     final << new_str[index].upcase
  #     index += 1
  #   elsif ALEPH.include?(new_str[index]) && index.odd?
  #     final << new_str[index].downcase
  #     index += 1
  #   elsif ALEPH.include?(new_str[index]) == false
  #     final << new_str[index]
  #   end
  #   break if index == new_str.size
  # end

  # str.chars.each_with_index do |letter, index|
  #   if ALEPH.include?(letter) && index.even?
  #     final << letter.upcase
  #   elsif ALEPH.include?(letter) && index.odd?
  #     final << letter.downcase
  #   elsif ALEPH.include?(letter) == false
  #     # next index
  #     # final << letter
  #   end
  # end

  final.join
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS')
p staggered_case('ignore 77 the 444 numbers')

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'