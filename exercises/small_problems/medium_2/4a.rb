=begin
FURTHER EXPLORATION
square brackets, curly braces, single and double quotation marks
=end

def balanced?(string)
  paren = 0
  brack = 0
  curly = 0
  single = 0
  double = 0

  string.each_char do |c|
   paren += 1 if c == '('
   paren -= 1 if c == ')'
   brack += 1 if c == '['
   brack -= 1 if c == ']'
   curly += 1 if c == '{'
   curly -= 1 if c == '}'
   single += 1 if c == "'"
   single -= 1 if c == "'"
   double += 1 if c == "\""
   double -= 1 if c == "\""
   break if paren < 0 || brack < 0 || curly < 0 || single < 0 || double < 0 
  end
  
  paren.zero? && brack.zero? && curly.zero? && single.zero? && double.zero?
end


# Examples
p balanced?('What [is] this?') == true
p balanced?('What is} this?') == false
p balanced?('What (is this?}') == false
p balanced?("([What] 'is this')?") == true
p balanced?("([What}) (is this))?") == false
p balanced?('Hey!') == true
p balanced?('}Hey!{') == false
p balanced?("What (\"is')) up(") == false
p balanced?('What [])(is{} up') == false