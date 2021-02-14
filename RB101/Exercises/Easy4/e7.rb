# The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer. String#to_i and the
# Integer constructor (Integer()) behave similarly. In this exercise, you will
# create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

def string_to_integer(str)
  counter = 0
  int = 0

  loop do
    if str[counter] == "0"
     int << 0
    elsif str[counter] == "1"
      int << 1
    elsif str[counter] == "2"
      int << 2
    elsif str[counter] == "3"
      int <<3
    elsif str[counter] == "4"
      int <<4
    elsif str[counter] == "5"
      int <<5
    elsif str[counter] == "6"
      int <<6
    elsif str[counter] == "7"
      int << 7
    elsif str[counter] == "8"
      int <<8
    elsif str[counter] == "9"
      int <<9
    end
    counter += 1
    break if counter == str.size
    int
  end
end
# this solution is not working...



p string_to_integer('4321') == 4321
p string_to_integer('570') == 570