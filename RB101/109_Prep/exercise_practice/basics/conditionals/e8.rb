status = ['awake', 'tired'].sample

# def sleep(result)
#   if result == "awake"
#     return "be productive"
#   else
#     return "go to sleep"
#   end
# end

# return_value = sleep(status)

return_value = if status == "awake"
    "be productive"
  else
    "go to sleep"
  end



p return_value

