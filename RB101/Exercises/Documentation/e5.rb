
# What do each of these puts statements output?

a = %w(a b c d e)
# puts a.fetch(7)
# nil because position 7 doesn't exist?
puts a.fetch(7, 'beats me')
# didn't figure this one out... returns the default "beats me"
puts a.fetch(7) { |index| index**2 }
# fetch(7) doesn't exist so returns the value of the block - 49 



