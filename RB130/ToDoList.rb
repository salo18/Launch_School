# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  # attr_reader :todos
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "can only add Todo objects" unless todo.class == Todo

    @todos << todo
  end
  # alias_method :add

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def to_a
    # @todos.to_a
    @todos.clone
  end

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def item_at(idx)
    @todos.fetch(idx)
    # puts "Index error" if @todos[idx] == nil
  end

  def mark_done_at(idx)
    # if (0..@todos.size).include?(idx)
    #   @todos[idx].done!
    # else
    #   "Index Error"
    # end
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    # if (0..@todos.size).include?(idx)
    #   @todos[idx].undone!
    # else
    #   "Index Error"
    # end
    item_at(idx).undone!
  end

  def done!
    @todos.each {|todo| todo.done! }
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))

    # if (0..@todos.size).include?(idx)
    #   @todos.delete_at(idx)
    # else
    #   "Index Error"
    # end
  end

  # def to_s
  #   puts "---- #{title} ----"
  #   @todos.each {|todo| puts todo.to_s}
  # end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  # doesn't return the original object like Array#each does
  # def each
  #   @todos.each do |todo|
  #     yield(todo)
  #   end
  #   @todos
  # end

  # each that returns orignal object like Array#each
  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  # select - my version
  # def select
  #   new_arr = []
  #   @todos.select do |todo|
  #     value = yield(todo)
  #     new_arr.push(todo) if !!value == true
  #   end
  #   new_arr
  # end

  # select - LS version
  # def select
  #   results = []
  #   each do |todo|
  #     results << todo if yield(todo)
  #   end
  #   results
  # end

  # Select returning a TodoList object
  def select
    results = TodoList.new(title)
    each do |todo|
      results.add(todo) if yield(todo)
    end
    results
  end

  def find_by_title(string)
    # takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
    select {|todo| todo.title == string }.first
  end

  def all_done
    # returns new TodoList object containing only the done items
    select {|todo| todo.done? }
  end

  def all_not_done
    # returns new TodoList object containing only the not done items
    select {|todo| !todo.done? }
  end

  def mark_done(string)
    # takes a string as argument, and marks the first Todo object that matches the argument as done.
    select {|todo| todo.title == string}.first.done!
  end

  def mark_all_done
    # mark every todo as done
    each {|todo| todo.done! }
  end

  def mark_all_undone
    # mark every todo as not done
    each {|todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)
todo1.done!
todo2.done!

# p list.find_by_title("Go to gym")
# p list.all_done
# p list.all_not_done
# p list.mark_all_undone
# list.to_s
list.mark_done("Go to gym")
# list.to_s

# SELECT
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect


# EACH
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# todo4 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)
# list.add(todo4)

# p list.find_by_title("Go to gym")

# list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end

# # given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# # list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add


# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# #to_a
# list.to_a                      # returns an array of all items in the list

# #done?
# list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# # list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
# # list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# # list.shift                      # removes and returns the first item in list

# # pop
# # list.pop                        # removes and returns the last item in list

# # remove_at
# # list.remove_at                  # raises ArgumentError
# # p list.remove_at(1)               # removes and returns the 2nd item
# # p list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym


# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# puts list

# list.pop

# puts list

# list.mark_done_at(1)

# puts list

