class Pet
  attr_reader :species, :name

  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{species} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  attr_reader :unadopted_pets, :adoptions
  def initialize(unadopted_pets = [])
    @unadopted_pets = unadopted_pets
    @adoptions = {}
  end

  def adopt(owner, pet)
    owner.pets << pet
    adoptions[owner.name] = owner.pets 
    unadopted_pets.delete(pet)
  end

  def number_of_unadopted_pets
    unadopted_pets.size
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      puts "#{owner} had adopted the following pets:"
      pets.each { |pet| puts pet }
      puts
    end
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following pets to adopt:"
    unadopted_pets.each { |pet| puts pet }
    puts
  end
      
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
billy        = Pet.new('cat', 'Billy')
amina        = Pet.new('cat', 'Amina')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
croder  = Owner.new('C Röder')

shelter = Shelter.new([butterscotch, pudding, darwin, kennedy, sweetie, molly, chester, asta, laddie, fluffy, kat, ben, chatterbox, bluebell, billy, amina])
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(croder, billy)
shelter.adopt(croder, amina)

shelter.print_adoptions
shelter.print_unadopted_pets

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{croder.name} has #{croder.number_of_pets} adopted pets."

