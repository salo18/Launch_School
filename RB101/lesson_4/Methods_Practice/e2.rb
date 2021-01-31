# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# count will return the result of the block, which is 2
# count considers the truthinness of the block's return value
