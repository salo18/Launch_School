# Write a method that takes a String as an argument, and returns a new String that
# contains the original value using a staggered capitalization scheme in which every
# other character is capitalized, and the remaining characters are lowercase.
# Characters that are not letters should not be changed, but count as characters when
# switching between upper and lowercase.

def staggered_case(str)
  new_str = str.chars
  final = []
  index = 0
  loop do
    if index.even?
      final << new_str[index].upcase
    elsif index.odd?
      final << new_str[index].downcase
    end
    index += 1
    break if index == str.size
  end
final.join('')
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

