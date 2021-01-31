# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# line 5 is the last line in the method and is the line that will be evaluated.
# hi is a truthy value so the method will return an empty array

# LS Answer...
# my analysis was correct.. hi is truthy but the original array is returned 