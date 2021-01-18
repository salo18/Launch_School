# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# greetings still equals the hash { a: "hi" }
# wrong... greeting will change to { a: "hi there" } because the << method mutates the
# caller and thus will not only modify informal_greeting but also greetings 

