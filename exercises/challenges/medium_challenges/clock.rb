class Clock
  attr_reader :hours, :minutes

  ONE_DAY = 24 * 60

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def +(number)
    new_time_in_minutes = convert_current_time_to_minutes + number
    h = new_time_in_minutes.div(60) % 24
    m = new_time_in_minutes % 60
    Clock.at(h, m)
  end

  def -(number)
    new_time_in_minutes = convert_current_time_to_minutes - number
    new_time_in_minutes += ONE_DAY if new_time_in_minutes < 0 
    h = new_time_in_minutes.div(60) % 24
    m = new_time_in_minutes % 60
    Clock.at(h, m)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def self.at(hours = 0, minutes = 0)
    Clock.new(hours, minutes)
  end

  def convert_current_time_to_minutes
    hours * 60 + minutes
  end
end

clock = Clock.at(10)
clock + 3
puts clock