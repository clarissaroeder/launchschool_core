require 'yaml'

MESSAGES = YAML.load_file('mortgage_messages.yml')

MONTHS_IN_YEAR = 12

def prompt(message)
  print("=> #{message}")
end

def name_valid?(name)
  name.strip!
  !name.empty?
end

def integer?(num)
  Integer(num, exception: false) != nil
end

def float?(num)
  Float(num, exception: false) != nil
end

def number?(num)
  integer?(num) || float?(num)
end

def non_zero?(num)
  num.to_i > 0 || num.to_f > 0
end

def negative?(num)
  num.to_i >= 0 || num.to_f >= 0
end

def two_decimals?(num)
  if num.include?('.')
    num.split('.').last.size <= 2
  else
    true
  end
end

def get_name
  name = ''
  loop do
    name = gets.chomp
    if
      name_valid?(name)
      break
    else
      prompt(MESSAGES['invalid_name'])
      prompt("")
    end 
  end
  name
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amount_prompt'])
    loan_amount = gets.chomp

    if number?(loan_amount) && non_zero?(loan_amount) && two_decimals?(loan_amount)
      break
    else
      prompt(MESSAGES['invalid_amount'])
    end
  end
  loan_amount
end

def get_apr
  apr = ''
  loop do
    prompt(MESSAGES['apr_prompt'])
    apr = gets.chomp

    if number?(apr) && negative?(apr) && two_decimals?(apr)
      break
    else
      prompt(MESSAGES['invalid_apr'])
    end
  end
  apr
end

def get_years
  loan_years = ''
  loop do
    prompt(MESSAGES['years'])
    loan_years = gets.chomp

    if integer?(loan_years) && negative?(loan_years)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end
  loan_years
end

def get_months
  loan_months = ''
  loop do
    prompt(MESSAGES['months'])
    loan_months = gets.chomp

    if integer?(loan_months) && negative?(loan_months)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end
  loan_months
end

def get_loan_duration
  prompt(MESSAGES['duration_prompt'])
  loan_years = ''
  loan_months = ''

  loop do
    loan_years = get_years
    loan_months = get_months

    if non_zero?(loan_years) || non_zero?(loan_months)
      break
    else
      prompt(MESSAGES['invalid_duration'])
    end
  end
  loan_duration = convert_to_months(loan_years, loan_months)
end

def convert_to_months(num1, num2)
  months = (num1.to_i * MONTHS_IN_YEAR) + num2.to_i
end

def calculate_monthly_pay(loan_amount, monthly_interest, loan_duration)
  if monthly_interest == 0
    monthly_pay = loan_amount.to_f / loan_duration
  else
    monthly_pay = loan_amount.to_f * (monthly_interest /
    (1 - (1 + monthly_interest)**(-loan_duration)))
  end
  monthly_pay
end

# START
system "clear"
prompt(MESSAGES['welcome'])
prompt(MESSAGES['div'])
prompt(MESSAGES['name_prompt'])
name = get_name
puts ''
prompt(format(MESSAGES['greet'], name: name))

# Main loop
loop do
  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration = get_loan_duration

  # Calculations
  monthly_interest = apr.to_f / 100 / MONTHS_IN_YEAR
  monthly_pay =
    calculate_monthly_pay(loan_amount, monthly_interest, loan_duration)
  total_pay = monthly_pay * loan_duration
  interest_total = total_pay - loan_amount.to_f

  # Results
  print("\n")
  prompt(MESSAGES['results'])
  prompt("  Payment every month: $#{format('%.2f', monthly_pay)}\n")
  prompt("  Total of #{loan_duration} payments: $#{format('%.2f', total_pay)}\n")
  prompt("  Total interest: $#{format('%.2f', interest_total)}\n\n")

  prompt(MESSAGES['again'])
  answer = gets.chomp
  print("\n")
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])
