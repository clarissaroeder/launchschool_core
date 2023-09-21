class StackEmptyError < StandardError; end

class Minilang
  attr_accessor :register, :stack, :commands

  def initialize(commands)
    @register = 0
    @stack = []
    @commands = commands.split
  end

  def eval
    commands.each do |command|
      if command =~ /\A[-+]?\d+\z/
        self.register = command.to_i
      else
        begin
          self.send command.downcase.to_sym
        rescue StackEmptyError
          puts "Empty Stack!"
          return
        rescue NoMethodError
          puts "Invalid Token: #{command}"
          return
        end
      end
    end
  end

  def push
    stack << register
  end

  def add
    self.register += stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def pop
    if stack.empty?
      raise StackEmptyError
    end

    self.register = stack.pop
  end

  def print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval 
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)