class Banner
  MAX_WIDTH = 80

  def initialize(message, width = (message.size + 2))
    @message = message
    @width = width
  end

  def to_s
    if @width < @message.size
      "The specified width is too small!"
    elsif @width > MAX_WIDTH
      "The specified width is too large!"
    else
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    end
  end

  private

  
  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end


# Examples
banner = Banner.new('To boldly go where no one has gone before.', 70)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+