class Triangle
  attr_reader :sides

  def initialize(side_1, side_2, side_3)
    @sides = [side_1, side_2, side_3]

    raise ArgumentError, "Invalid triangle sides" unless valid?
  end

  def kind
    case
    when sides[0] == sides[1] && sides[1] == sides[2]
      'equilateral'
    when sides[0] != sides[1] && sides[1] != sides[2] && sides[0] != sides[2]
      'scalene'
    else
      'isosceles'
    end
  end

  private
  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[0] + sides[2] > sides[1] &&
    sides[1] + sides[2] > sides[0]
  end
end