class CustomSet
  attr_reader :collection

  def initialize(array = [])
    # values can be stored in any order
    @collection = array.uniq
  end

  def empty?
    collection.empty?
  end

  def contains?(num)
    collection.include?(num)
  end

  def subset?(other)
    collection.all? { |num| other.contains?(num) }
  end

  def disjoint?(other)
    collection.none? { |num| other.contains?(num) } &&
    other.collection.none? { |num| contains?(num) }
  end

  def eql?(other)
    collection.sort == other.collection.sort
  end

  def add(num)
    collection.push(num) unless contains?(num)
    self
  end

  def intersection(other)
    # new set that only contains values that are present in both current and other
    common_elements = collection.select { |num| other.contains?(num) }
    CustomSet.new(common_elements)
  end

  def difference(other)
    # new set that only contains values that this set does not share with other
    differing_elements = collection.select { |num| !other.contains?(num) }
    CustomSet.new(differing_elements)
  end

  def union(other)
    # new set with values from both current and other (no duplicates)
    combined_elements = (collection + other.collection).uniq
    CustomSet.new(combined_elements)
  end

  def ==(other)
    eql?(other)
  end
end

# p CustomSet.new([1, 2, 3]).add(3)
