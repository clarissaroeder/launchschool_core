# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def generate_uuid
  characters = []
  (0..9).each { |n| characters << n.to_s}
  ('a'..'f').each { |c| characters << c}

  uuid = []
  [8, 4, 4, 4, 12].each do |num|
    num.times do 
      uuid << characters.sample
    end
  uuid << "-"
  end
  uuid.join.chop
end

p generate_uuid