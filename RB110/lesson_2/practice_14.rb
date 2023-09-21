# Return an array containing the colors of the fruits, and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.map do |_, characteristics|
  if characteristics[:type] == 'vegetable'
    characteristics[:size].upcase
  else
    characteristics[:colors].map { |c| c.capitalize}
  end
end

p arr

# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]