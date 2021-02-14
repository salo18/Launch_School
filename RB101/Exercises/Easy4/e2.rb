# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

def abbreviation(year)
  cent = ""
  if year.to_s.end_with?("0")
    cent = year / 100
  else
    cent = (year / 100) + 1
  end

  return 'th' if [11, 12, 13].include?(year % 100)

  abb = ""

  if cent.to_s.end_with?("0","4", "5", "6", "7", "8", "9", "10")
    abb = "th"
  elsif cent.to_s.end_with?("1")
    abb = "st"
  elsif cent.to_s.end_with?("2")
    abb = "nd"
  elsif cent.to_s.end_with?("3")
    abb = "rd"
  end
  abb
end

def century(year)
  new_year = ""
  if year.to_s.end_with?("0")
    new_year = year / 100
  else
    new_year = (year / 100) + 1
  end
  super_year = new_year.to_s
  super_year + abbreviation(new_year)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

