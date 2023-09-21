# Bonus: extract messages into a configuration file
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

# Bonus: provide option for different languages
def messages(message, lang='en')
  MESSAGES[lang][message]
end

LANG = 'en'

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Bonus: optimise number validation. First, check for integer, then float.
def integer?(num)
  # Setting exception to false prevents the raising of a Type or ArgumentError
  # in case of not convertible input, but instead returns nil.
  Integer(num, exception: false) != nil
end

def float?(num)
  Float(num, exception: false) != nil
end

def valid_number?(num)
  integer?(num) || float?(num)
end

# Bonus: optimise this method so case statement isn't last expression
def operation_to_message(operation)
  action = case operation
           when '1'
             messages('add', LANG)
           when '2'
             messages('subtract', LANG)
           when '3'
             messages('multiply', LANG)
           when '4'
             messages('divide', LANG)
           end
  action
end

prompt(messages('welcome', LANG))

# name loop
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('invalid_name', LANG))
  else
    break
  end
end

prompt((messages('greeting', LANG) + name + '!'))

# main loop
loop do
  # get first number
  number1 = ''
  loop do
    prompt(messages('number1', LANG))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(messages('invalid_number', LANG))
    end
  end

  # get second number
  number2 = ''
  loop do
    prompt(messages('number2', LANG))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('invalid_number', LANG))
    end
  end

  # get operation
  prompt(messages('operator_prompt', LANG))
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('invalid_op', LANG))
    end
  end

  # compute result
  prompt(operation_to_message(operator) + messages('computing', LANG))

  result =
    case operator
    when '1'
      number1.to_i() + number2.to_i()
    when '2'
      number1.to_i() - number2.to_i()
    when '3'
      number1.to_i() * number2.to_i()
    when '4'
      number1.to_f() / number2.to_f()
    end

  prompt(messages('result', LANG) + "#{result}!")

  prompt(messages('again', LANG))
  answer = Kernel.gets().chomp
  break unless answer.downcase().start_with?('y')
end

prompt(messages('goodbye', LANG))
