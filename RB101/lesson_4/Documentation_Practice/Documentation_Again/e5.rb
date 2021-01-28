# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7)
# c or nil if it doesn't repeat when out of range
# returns an error -- out of range
puts a.fetch(7, 'beats me')
# beats me
puts a.fetch(7) { |index| index**2 }
# didn't know this one... returned 49. ignored the array and did 7**2