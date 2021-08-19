# 1
# def interleave(arr1, arr2)
#   new_arr = []
#   index = 0
#   loop do
#     new_arr << arr1[index]
#     new_arr << arr2[index]
#     index += 1
#     break if index == arr1.size
#   end
#   new_arr
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# 2
# def letter_case_count(string)
#   lower_case = ("a".."z").to_a
#   upper_case = ("A".."Z").to_a

#   hash = {lowercase: 0, uppercase: 0, neither: 0}
#   string.chars.each do |char|
#     if lower_case.include?(char)
#       hash[:lowercase] += 1
#     elsif upper_case.include?(char)
#       hash[:uppercase] += 1
#     else
#       hash[:neither] += 1
#     end
#   end
#   hash
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# 3
=begin
algo:
- split the string into an array of words
- iterate through each word
-- capitalize the first letter in each word
=end
# def word_cap(str)
#   # str.split.map(&:capitalize).join(" ")
#   # str.split.map do |word|
#   #   word.chars.map do |letter|
#   #     if word[0] == letter
#   #       letter.upcase
#   #     else
#   #       letter.downcase
#   #     end
#   #   end.join("")
#   # end.join(" ")
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# 4
# def swapcase(str)
#   str.chars.map do |letter|
#     if letter.upcase == letter
#       letter.downcase
#     elsif letter.downcase == letter
#       letter.upcase
#     end
#   end.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# 5
# def staggered_case(string)
#   new_str = ""
#   arr = string.chars
#   arr.each_with_index do |letter, idx|
#     if idx.even?
#       new_str << letter.upcase
#     else idx.odd?
#       new_str<< letter.downcase
#     end
#   end
#   new_str
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# 6
# def staggered_case(string)
#   new_str = ""
#   alphabet = ("a".."z").to_a + ("A".."Z").to_a
#   index = 0
#   string.chars.each do |letter|
#     if alphabet.include?(letter)
#       if index.even?
#         new_str << letter.upcase
#         index += 1
#       else index.odd?
#         new_str<< letter.downcase
#         index += 1
#       end
#     else
#       new_str << letter
#     end
#   end
#   new_str
# end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# 7
# def show_multiplicative_average(arr)
#   product = 1.to_f
#   arr.each {|n| product *= n}
#   avg = product / arr.size
#   format('%.3f', avg)
# end
# p show_multiplicative_average([3, 5])                # => The result is 7.500
# p show_multiplicative_average([6])                   # => The result is 6.000
# p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# 8
# def multiply_list(arr1, arr2)
#   # new_arr = []
#   # arr1.each_with_index do |num, idx|
#   #  new_arr << num * arr2[idx]
#   # end
#   # new_arr
#   zipped_pairs = arr1.zip(arr2)
#   zipped_pairs.map {|ar| ar.inject(:*)}
# end
# p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

# 9
def multiply_all_pairs(arr1, arr2)
  first_index = 0
  second_index = 0
  new_arr = []
  a2_size = arr2.size - 1
  loop do
    loop do
      new_arr << (arr1[first_index] + arr2[second_index])
      second_index += 1
      break if second_index == a2_size
    end
    first_index += 1
    break if first_index == arr1.size
  end
new_arr
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


