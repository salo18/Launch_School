=begin
To Do List features:

v1
X add a to do list item
  X name & description
X display to do list
X remove to do list and add it to list of "finished" to-do's

v2
# add "done" boolean flag?
  - can toggle back and forth (true or false)
# comparison to see if two todo's are the same
=end


class List
  attr_reader :todos, :completed
  # attr_accessor :todos

  def initialize
    @todos = []
    @completed= []
    @break = false
  end

  def greeting
    puts ""
    puts "Welcome to To Do! You currently don't have any todo's yet."
  end

  def add_todo
    puts "Add a to do..."
    puts "To Do Name:"
    name = gets.chomp
    puts "To Do Description:"
    description = gets.chomp
    @todos << ToDo.new(name, description)
  end

  def display_todos
    puts "You have #{todos.size} To Do's"
    todos.each_with_index {|todo, idx| puts "#{idx+1}. #{todo}" }
  end

  def display_completed
    puts "You have completed #{completed.size} To Do's"
    completed.each_with_index {|todo, idx| puts "#{idx+1}. #{todo}" }
  end


  def next_move
    puts ""
    puts "Would you like to..."
    puts "1. Add a To Do"
    puts "2. Mark a To Do as Complete" # pending
    puts "3. View unfinished to do's" # pending
    puts "4. View completed to do's" # pending
    puts "5. Exit program"
    puts ""
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if (1..5).include?(answer)
      puts "That's not valid... Enter a number between 1 and 5"
    end

    case answer
    when 1
      add_todo
    when 2
      mark_complete
    when 3
      display_todos
    when 4
      display_completed
    when 5
      @break = true
    end
    answer
  end

  def mark_complete
    puts ""
    puts "Which to do is complete? Enter a number and it will be removed from your list of pending To Do's:"
    puts ""
    display_todos
    answer = nil
    limit = todos.size
    loop do
      answer = gets.chomp.to_i
      break if (1..limit).include?(answer)
      puts "That's not valid... Enter a number between 1 and #{limit}"
    end

    completed << todos[answer-1]
    todos.delete_at(answer-1)
    puts "Success! To Do has been deleted and has been marked as complete."
  end

  def start
    greeting
    loop do
      break if @break == true
      next_move
    end
  end

end

# add "done" boolean flag
class ToDo
  attr_reader :name, :description
  def initialize(name, description)
    @name = name
    @description = description
  end

  def to_s
    "Name: #{name} || Description: #{description}"
  end

end

List.new.start



