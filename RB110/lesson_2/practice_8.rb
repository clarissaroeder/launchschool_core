hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)

hsh.each do |_, arr|
  arr.each do |str|
    str.chars.each { |c| puts c if vowels.include?(c) }
  end
end
