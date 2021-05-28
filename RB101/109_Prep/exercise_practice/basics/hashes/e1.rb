# # e1
# car = {
#   type: "Sedan",
#   color: "blue",
#   milage: 80,000
# }

# e2
# car = {
#   type:    'sedan',
#   color:   'blue',
#   mileage: 80_000
# }

# car[:year] = 2003

# p car

#e3

# car = {
#   type:    'sedan',
#   color:   'blue',
#   mileage: 80_000,
#   year:    2003
# }

# car.delete(:mileage)
# p car


# e4
# car = {
#   type:    'sedan',
#   color:   'blue',
#   year:    2003
# }

# p car[:color]

# e5
# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
# numbers.each do |k, v|
#   puts "A #{k} number is #{v}"
# end

# e6

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
# half_numbers = numbers.map do |k, v|
#   v / 2
# end

# p half_numbers

# e7
# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }

# low_numbers = numbers.select {|k,v| v < 25}

# p low_numbers

# e8

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }

# low_numbers = numbers.select! do |key, value|
#                  value < 25
#                end

# p low_numbers
# p numbers

# e9
# hash = {
#   car:   { type: 'sedan', color: 'blue', year: 2003 },
#   truck: { type: 'pickup', color: 'red', year: 1998 }
# }
# p hash[:car]

# e10
# car = {
#   type:  'sedan',
#   color: 'blue',
#   year:  2003
# }

car = [[type: "sedan"], [color: "blue"], [year: 2003]]

