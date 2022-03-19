require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'

  set :erb, :escape_html => true
end

helpers do
  def list_complete?(arr)
    return true if arr[:todos].all? {|li| li[:completed] == true} && arr[:todos].size > 0
    false
  end

  def list_class(list)
    "complete" if list_complete?(list)
    # list_complete?(list) ? "complete" : ""
  end

  def todos_remaining(arr)
    arr.select {|hsh| hsh[:completed] == true }.size
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition {|list| list_complete?(list)}

    incomplete_lists.each {|list| yield list, lists.index(list)}
    complete_lists.each {|list| yield list, lists.index(list)}
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition {|todo| todo[:completed]}

    incomplete_todos.each {|todo| yield todo, todos.index(todo)}
    complete_todos.each {|todo| yield todo, todos.index(todo)}
  end
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# view list of lists
get "/lists" do
  @lists = session[:lists]

  erb :lists, layout: :layout
end

# render new list form
get "/lists/new" do
  erb :new_list
end

# Return error msg if name is invalid
# Return nil if name is valid
def error_for_list_name(name)
  if !(1..100).cover? name.size
    "List name must be between 1 and 100 characters."
  elsif session[:lists].any? {|list| list[:name] == name}
    "List name must be unique."
  end
end

# create  a new list
post "/lists" do
  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list
  else
    session[:lists] << {name: list_name, todos: []}
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

def list_exists?(lists, index)
  if index > (lists.size - 1)
    "The specified list was not found"
  end
end

# VIEW INDIVIDUAL LIST
get "/lists/:id" do
  @lists = session[:lists]

  @num = params[:id].to_i

  error = list_exists?(@lists, @num)
  if error
    session[:error] = error
    redirect "/lists"
  else
    @name = session[:lists][@num][:name]

    @list = session[:lists][@num]

    @todos = session[:lists][@num][:todos]

    erb :list_view
  end
end

def error_for_todo_name(name)
  if !(1..100).cover? name.size
    "Todo name must be between 1 and 100 characters."
  end
end

# ADD A NEW TODO ITEM
post "/lists/:id/todos" do
  @num = params[:id].to_i
  @todos = session[:lists][@num][:todos]
  todo = params[:new_todo].strip
  @name = session[:lists][@num][:name]

  error = error_for_todo_name(todo)

  if error
    session[:error] = error
    redirect "/lists/#{@num}"
    # erb :list_view
  else
    session[:lists][@num][:todos] << {name: todo, completed: false}
    session[:success] = "The todo has been added."
    redirect "/lists/#{@num}"
  end
end

# DELETE TODO ITEM
post "/lists/:list_id/todos/:id/destroy" do
  list_id = params[:list_id].to_i
  index = params[:id].to_i

  session[:lists][list_id][:todos].delete_at(index)
  session[:success] = "The todo has been deleted."
  redirect "/lists/#{list_id}"
end

# UPDATE STATUS OF TODO
post "/lists/:list_id/todos/:id" do
  list_id = params[:list_id].to_i
  todo_id = params[:id].to_i

  is_completed = params[:completed] == "true"
  session[:lists][list_id][:todos][todo_id][:completed] = is_completed

  session[:success] = "The todo has been updated."
  redirect "/lists/#{list_id}"
end

# Complete ALL TODOS
post "/lists/:list_id/complete_all" do
  list_id = params[:list_id].to_i

  session[:lists][list_id][:todos].each do |todo|
    todo[:completed] = true
  end

  session[:success] = "All todos have been completed."
  redirect "/lists/#{list_id}"
end

# EDIT LIST NAME
get "/lists/:id/edit" do
  @num = params[:id].to_i

  @list = session[:lists][@num]

  erb :edit_list
end

# UPDATE EXISTING TODO LIST NAME
post "/lists/:id" do
  @num = params[:id].to_i
  @list = session[:lists][@num]

  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list
  else
    @list[:name] = list_name
    session[:success] = "The list name has been updated."
    redirect "/lists/#{@num}"
  end
end

# Delete a to do list
post "/lists/:id/destroy" do
  @num = params[:id].to_i

  session[:lists].delete_at(@num)
  session[:success] = "The list has been deleted."

  redirect "/lists"
end

# not_found do
#   redirect "/lists"
# end




# VIEW INDIVIDUAL LIST FORM
# post "/lists/" do
#   @num = params[:id].to_i

#   # todo = params[:new_todo]
#   # session[:lists][@num][:todos] << todo
#   redirect "/lists/:id"
# end