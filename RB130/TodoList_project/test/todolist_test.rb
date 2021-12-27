# require 'simplecov'
# SimpleCov.start
require 'bundler/setup'

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

# require_relative 'todolist'
require_relative '../lib/todolist'
require 'date'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift ## ask about this... can I do this implementation vs LS implementation?
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size) # does this work? -- ask if its the same as #to_a
  end

  def test_pop
    pop = @list.pop
    assert_equal(@todo3, pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add("hi") }
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add({}) }
    assert_raises(TypeError) { @list.add([]) }
  end

  def test_shovel
    new_todo = Todo.new("new test")
    @list << new_todo
    @todos << new_todo
    # assert_equal(4, @list.size)
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    # # @list.add(Todo.new("new test"))
    # # assert_equal(4, @list.size)

    # new_todo = Todo.new("new test")
    # @list.add(new_todo)
    # # @todos.add(new_todo)

    # assert_equal(4, @list.size)

    new_todo = Todo.new("new test")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100)}
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.item_at(100)}
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }

    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_1done
    @list.mark_done_at(0)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each {|todo| result << todo}
    assert_equal([@todo1, @todo2, @todo3], result)

    # new_var = @list.each {puts "a"}
    # assert_equal(new_var, @list)
    assert_equal(@list, @list.each {|todo| nil })
  end

  # def test_select

  #   new_list = TodoList.new("Today's Todos")
  #   # new_list.add(@todo1)

  #   @list.mark_done_at(0)
  #   assert_equal(new_list.add(@todo1), @list.select {|todo| todo.done?})
  # end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done?}.to_s )
  end

  def test_no_due_date
    assert_nil(@todo1.due_date)
  end

  def test_due_date
    due_date = Date.today + 3
    @todo2.due_date = due_date
    assert_equal(due_date, @todo2.due_date)
  end

  def test_to_s_with_due_date
    @todo2.due_date = Date.civil(2017, 4, 15)
    output = <<-OUTPUT.chomp.gsub(/^\s+/, '')
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room (Due: Saturday April 15)
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

end