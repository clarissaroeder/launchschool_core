# Write an exclusive or method

def xor?(exp1, exp2)
  if !!exp1 == true
    if !!exp2 == true
      false
    else
      true
    end
  elsif !!exp1 == false
    if !!exp2 == true
      true
    else
      false
    end
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false   