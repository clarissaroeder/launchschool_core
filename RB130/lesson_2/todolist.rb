# This class represents a todo item and its associated data
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.You can perform typical
# vollection-oriented actions on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def add(todo)
    if todo.is_a? Todo
      @todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
    
    @todos
  end
  alias_method :<<, :add

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    @todos.fetch(idx).done!
  end

  def mark_undone_at(idx)
    @todos.fetch(idx).undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def remove_at(idx)
    if idx <= (@todos.size - 1)
      @todos.delete_at(idx)
    else
      raise IndexError
    end
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end

  def each
    counter = 0
    
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end

    self
  end

  def select
    result = TodoList.new(title)

    each do |todo|
      result << todo if yield(todo)
    end

    result
  end

  def find_by_title(name)
    select { |todo| todo.title == name }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_undone
    select { |todo| !todo.done? }
  end

  def mark_done(name)
    find_by_title(name) && find_by_title(name).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect