class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    total_width = letters.length

    letters.each_with_object([]) do |letter, array|
      array << create_row(letter).center(total_width)
    end.join("\n") + "\n"
  end

  class << self
    def create_row(letter)
      if letter == 'A'
        letter
      else
        letter + padding_inside(letter) + letter
      end
    end

    def padding_inside(letter)
      all_letters = ['B']
      spaces = 1

      until all_letters.include? letter
        current_letter = all_letters.last
        all_letters << current_letter.next
        spaces += 2
      end

      ' ' * spaces
    end
  end
end

  # letter_idx = LETTERS.index(letter)
    # total_width = letter_idx * 2 + 1
    # padding_outside = total_width / 2
    # padding_inside = -1

    # # Upper half including widest part
    # 0.upto(letter_idx) do |i|
    #   if i == 0
    #     row = (SPACE * padding_outside) + LETTERS[i] + (SPACE * padding_outside) + NEWLINE
    #     diamond << row
    #     padding_outside -= 1
    #   else
    #     padding_inside += 2
    #     row = (SPACE * padding_outside) + LETTERS[i] + (SPACE * padding_inside) + LETTERS[i] + (SPACE * padding_outside) + NEWLINE
    #     diamond << row
    #     next if i == letter_idx
    #     padding_outside -= 1
    #   end
    # end

    # # Lower half
    # (letter_idx - 1).downto(0) do |i|
    #   if i == 0
    #     padding_outside += 1
    #     row = (SPACE * padding_outside) + LETTERS[i] + (SPACE * padding_outside) + NEWLINE
    #     diamond << row
    #   else
    #     padding_outside += 1
    #     padding_inside -= 2
    #     row = (SPACE * padding_outside) + LETTERS[i] + (SPACE * padding_inside) + LETTERS[i] + (SPACE * padding_outside) + NEWLINE
    #     diamond << row
    #   end
    # end