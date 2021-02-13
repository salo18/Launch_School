# return an array containing the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# arr = []

# hsh.map do |sub|
#   sub.select do ||
# end

# hsh.each_pair do |k, v|
#   if v == "vegetable"
#     arr << v[:colors]
#   end
# end

# p arr

# return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


# couldn't figure this one out... LS answer:
hash = hsh.map do |_, value|
  if value[:type] == "fruit"
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == "vegetable"
    value[:size].upcase
  end
end

p hash