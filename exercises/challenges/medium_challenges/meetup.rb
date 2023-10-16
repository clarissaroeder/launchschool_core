require 'date'

class Meetup
  attr_reader :year, :month, :last_day_of_the_month

  def initialize(year, month)
    @year = year
    @month = month
    @last_day_of_the_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase + '?'
    schedule = schedule.downcase

    date_range = calculate_date_range(schedule).to_a
    day = date_range.select { |d| Date.civil(year, month, d).send(weekday) }.last
  
    return nil if day.nil?
    Date.civil(year, month, day)
  end

  def calculate_date_range(schedule)
    case schedule
    when 'first' then (1..7)
    when 'second' then (8..14)
    when 'third' then (15..21)
    when 'fourth' then (22..28)
    when 'fifth' then (29..last_day_of_the_month) # 29 til last of month unless february
    when 'last' then (22..last_day_of_the_month)
    when 'teenth' then (13..19)
    end
  end

end

meetup = Meetup.new(2015, 2)
p meetup.day('wednesday', 'fifth')