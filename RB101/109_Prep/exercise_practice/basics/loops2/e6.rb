names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  name = names.pop
  puts name
  break if names.empty?
end