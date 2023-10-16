class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def size
    size = 0
    current_element = head

    while current_element
      size += 1
      current_element = current_element.next
    end

    size
  end

  def empty?
    !@head
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def pop
    temp = head
    @head = head.next
    temp.datum
  end

  def peek
    head.datum if head
  end

  def reverse
    reversed_list = SimpleLinkedList.new
  
    current_element = head
    while current_element
      reversed_list.push(current_element.datum)
      current_element = current_element.next
    end

    reversed_list
  end

  def to_a
    result = []
    
    current_element = head
    while current_element
      result.push(current_element.datum)
      current_element = current_element.next
    end

    result
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse.each { |value| list.push(value) }
    list
  end
end