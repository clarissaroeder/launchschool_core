class BeerSong
  def self.verse(num)
    case num
    when 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    when 1
      "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(first, last)
    (last..first).to_a.reverse.map { |num| verse(num) }.join("\n")
    
    # verses = ''

    # while num1 >= num2
    #   verses << verse(num1)
    #   verses << "\n"
    #   num1 -= 1
    # end

    # verses.chomp
  end

  def self.lyrics
    verses(99, 0)
  end
end
