# Write a method that will take a short line of text, and print it within a box.

def print_in_box(message)
  horizontal_message = "+#{"-" * (message.size + 2)}+"
  empty_message = "|#{" " * (message.size + 2)}|"

  puts horizontal_message
  puts empty_message
  puts "| #{message} |"
  puts empty_message
  puts horizontal_message

end

# had no idea how to do this... should have written a pedac for this but still
# would not known how to do it


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+