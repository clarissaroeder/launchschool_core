class Robot
  attr_reader :robot_name

  @@used_names = []

  def name
    @robot_name = generate_name if robot_name.nil?
    robot_name
  end

  def reset
    @@used_names.delete(@robot_name)
    @robot_name = generate_name
  end

  private

  def generate_name
    name = ''
  
    loop do
      name << generate_letters
      name << generate_numbers

      break unless @@used_names.include? name
      name = ''
    end

    @@used_names << name
    name
  end

  def generate_letters
    2.times.map { ('A'..'Z').to_a.sample }.join
  end

  def generate_numbers
    rand(0..999).to_s.rjust(3, '0')
  end
end