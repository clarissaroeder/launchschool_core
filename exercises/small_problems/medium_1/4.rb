=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, 
you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

ALGORITHM:
- Define a light/switch hash and populate from 1-n with all lights initially "off"
- Iterate over the hash n times:
  - If the key is a multiple of i, toggle the value
    - 

- Define a result hash and add all keys for which the value is 'on'
=end

def initialise_hash(n)
  lights = {}
  1.upto(n) { |k| lights[k] = 'off' }
  lights
end

def toggle(status)
  status == 'on' ? 'off' : 'on'
end

def select_on(hsh)
  hsh.select { |switch, status| status == 'on' }.keys
end

def repeat_switch(n)
  lights = initialise_hash(n)

  n.times do |i|
    lights.each { |switch, status| lights[switch] = toggle(status) if switch % (i + 1) == 0 }
  end

  select_on(lights)
end

p repeat_switch(5)
p repeat_switch(10)
p repeat_switch(1000)