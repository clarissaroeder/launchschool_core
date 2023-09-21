=begin
ALGORITHM:
- Define a light/switch hash and populate from 1-n with all lights initially "off"
- Iterate over the hash n times:
  - If the key is a multiple of i, toggle the value
    - 

- Define a result hash and add all keys for which the value is 'on'

Further exploration: use an array instead of a hash
Output text: (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.")
=end

NUMBER = 0
STATUS = 1

def initialise_array(n)
  lights = []
  1.upto(n) { |k| lights << [k, 'off'] }
  lights
end

def toggle_switch(status)
  status == 'on' ? 'off' : 'on'
end

def select_on(arr)
  result = []
  arr.map do |switch| 
    if switch[STATUS] == 'on' 
      switch[NUMBER]
    else
      []
    end
  end.flatten
end

def join_and(arr)
  case arr.size
  when 2
    arr[-1] = " and #{arr[-1]}"
    arr.join
  else
    arr[-1] = "and #{arr[-1]}"
    arr.join(", ")
  end
end

def describe(arr, round)
  if round == 1
    puts "round #{round}: every light is turned on"
  else
    puts "round #{round}: lights #{off_lights(arr)} are now off; #{on_lights(arr)} are on"
  end
end

def off_lights(arr)
  arr = arr.select { |switch| switch[STATUS] == 'off' }.map { |switch| switch[NUMBER] }
  join_and(arr)
end

def on_lights(arr)
  arr = arr.select { |switch| switch[STATUS] == 'on' }.map { |switch| switch[NUMBER] }
  join_and(arr)
end

def toggle_lights(n)
  lights = initialise_array(n)

  n.times do |i|
    lights.map { |switch| switch[STATUS] = toggle_switch(switch[STATUS]) if switch[NUMBER] % (i + 1) == 0 }
    describe(lights, (i + 1))
  end

  select_on(lights)
end

p toggle_lights(5)
p toggle_lights(10)
# p toggle_lights(1000)