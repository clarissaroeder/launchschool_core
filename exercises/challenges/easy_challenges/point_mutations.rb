class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    length = strand.length <= other.length ? strand.length : other.length
    counter = 0
    
    0.upto(length - 1) do |idx|
      counter += 1 if strand[idx] != other[idx]
    end

    counter
  end
end
