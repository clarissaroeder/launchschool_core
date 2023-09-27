=begin
Write a ROT13 decoder.
=end

ENCRYPTED_NAMES = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(string)
  result = ''
  string.each_char { |char| result << decode(char) }
  result
end

def decode(char)
  case char
  when 'a'..'m', 'A'..'M'
    (char.ord + 13).chr
  when 'n'..'z', 'N'..'Z'
    (char.ord - 13).chr
  else
    char
  end
end

ENCRYPTED_NAMES.each { |name| puts rot13(name) }