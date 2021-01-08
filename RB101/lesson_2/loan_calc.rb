# Take everything you've learned so far and build a mortgage calculator

# You'll need three pieces of information:
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# From the above, you'll need to calculate the following things:
# monthly interest rate
# loan duration in months
# monthly payment

# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# PSEUDO CODE:
# DONE need to ask the user for inputs:
# DONE what is the loan amount (integer)
# DONE what is the annual percentage rate (float divided by 12 for monthly %)
# DONE what is the loan duration (ask for years and convert to months)
# DONE need to validate user inputs (loops)
# need to make a method for loan calculation with all inputs predefined with given values
# need to output monthly interest rate, loan duration (months), monthly payment 
# need to loop the core program to ask user if they would like to run again?


def valid_loan?(num)
  num.to_i != 0
end 

def valid_apr?(num)
  num.to_f != 0
end

def apr_to_decimal(num)
  # need to convert a float into a percentage in number form 
  # ex - 3.25% APR to .0325 
  # num / 12 
  num1 = num.to_f.to_s.gsub!(".", "")
  if num1.to_i < 100 
    realnum1 = ".0#{num1}"
  else 
    realnum1 = ".#{num1}"
  end
  realnum1.to_f
end

def monthly_apr(num)
  num.to_f / 12
end

def loan_dur(num)
  num.to_i * 12
end

puts "Welcome to Loan Calculator!"
loop do  
  loan = ""
  loop do 
    puts "What is the loan amount?"
    loan = gets.chomp.to_i
    if valid_loan?(loan)
      break
    else 
      puts "That's not a valid number. Try again."
    end 
  end 

  apr = ""
  loop do 
    puts "What is the annual APR? Don't put a percentage, just the number."
    apr = gets.chomp.to_f
    if valid_apr?(apr)
      break
    else 
      puts "That's not a valid APR. Try again."
    end 
  end 

  dur = ""
  loop do 
    puts "What is the loan duration (years)?"
    dur = gets.chomp.to_i
    if valid_loan?(dur)
      break
    else 
      puts "That's not a valid number. Try again."
    end 
  end 

  # def loan_calc(loan_amount,monthly_apr,duration)
  #   loan_amount * (monthly_apr / (1 - (1 + monthly_apr)**(-duration)))
  # end

  def loan_calc(p,j,n)
    p * (j / (1 - (1 + j)**(-n)))
  end
  # m = p * (j / (1 - (1 + j)**(-n)))
  # m = monthly payment
  # p = loan amount
  # j = monthly interest rate
  # n = loan duration in months


  # convert user inputs into usable inputs for loan calculation 
  m_apr = apr_to_decimal(apr).to_f
  m_loan_dur = loan_dur(dur).to_i
  monthly_payment = loan * ()
  loan_calc(loan,apr_to_decimal(apr),loan_dur(dur))

  # outputs:
  puts "Your loan is for $#{loan}"
  puts "Your annual APR (#{apr}%) is #{monthly_apr(apr)}% per month"
  puts "Your loan is #{loan_dur(dur)} months"
  puts "Your monthly payment is $#{loan_calc(loan,apr_to_decimal(apr),loan_dur(dur))}"

  puts "Would you like to use Loan Calculator again? (Y for yes)"
  answer = gets.chomp.downcase
  if answer != "y"
    break
  end
end

puts "Thanks for using Loan Calculator. Good bye."