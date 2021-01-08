puts "Welcome to Loan Calculator!"

loop do
  puts "What is the loan amount? Please enter a positive number"
  loan = ""
  loop do
    loan = gets.chomp
    if loan.to_f < 0 || loan.empty? || loan.to_i == 0
      puts "Please enter a valid number"
    else
      break
    end
  end

  puts "What is the Annual APR? Please enter a positive number with the % sign"
  puts "For example, 3.25% APR should be entered as 3.25"
  apr = ""
  loop do
    apr = gets.chomp
    if apr.to_f < 0 || apr.empty? || apr.to_i == 0
      puts "Please enter a valid number"
    else
      break
    end
  end

  puts "What is the loan duration? Please enter a positive number"
  duration_years = ""
  loop do
    duration_years = gets.chomp
    if duration_years.to_f < 0 || duration_years.empty? || duration_years.to_i == 0
      puts "Please enter a valid number"
    else
      break
    end
  end

  annual_apr = apr.to_f / 100
  monthly_apr = annual_apr / 12
  monthly_apr_show = monthly_apr *100

  duration_months = duration_years.to_i * 12

  monthly_payment = loan.to_i * (monthly_apr / (1 - (1 + monthly_apr)**(-duration_months)))

  puts "Your loan is for $#{loan}"
  puts "Your APR is #{apr}% or #{monthly_apr_show}% per month"
  puts "Your duration is for #{duration_years} years or #{duration_months} months"

  puts "Your monthly payment is $#{monthly_payment}"

  # m = p * (j / (1 - (1 + j)**(-n)))
  # m = monthly payment
  # p = loan amount
  # j = monthly interest rate
  # n = loan duration in months

  puts "Do you want to use Loan Calculator again? Enter Y for yes."
  answer = gets.chomp.downcase
  if answer != "y"
    break
  end

end

puts "Thanks for using Loan Calculator!"