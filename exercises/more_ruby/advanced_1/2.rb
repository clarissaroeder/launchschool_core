# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

=begin
  Running this code produces output with no errors. It appears that calling puts
  results in the Procs object id being printed. To execute the Proc, you need to invoke
  #call. The Proc works both with and without an argument. If no argument is given, any use of 
  that argument is replaced by nil. This demonstrates lenient arity.
=end

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
  Running this code produces an ArgumentError. It seems that when you save a lambda in a
  variable, it gets converted to a Proc object as indicated by the #puts and #class calls.
  However, you can't call this lambda with the wrong argument number, demonstating lambdas
  strict arity.
=end

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin
  This demonstrates a methods strict arity. A present yield keyword demands a block being put
  in as an argument.
=end

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
  This demonstrates that blocks have lenient arity. The second invocation of block_method_2 defines 
  the block to have two parameters, but only one gets passed in via the yield keyword in the method.
  The code runs regardless and the parameter is replaced with nil.
  However, the yield keyword in the method is defined to take an argument, and if you define the block
  without any parameters, as with the third invocation, an error will be raised.
=end