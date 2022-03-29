require "sinatra"
require "sinatra/reloader" #if development?
require "tilt/erubis"
require "redcarpet"
require "yaml"
require "bcrypt"


# get "/" do
#   @files = Dir.children("data")

#   erb :index
# end

configure do
  enable :sessions
  set :session_secret, 'super secret'

  # set :erb, :escape_html => true
end

# @signed_in = false
# @username = ""
# @password = ""


# root = File.expand_path("..", __FILE__)

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)

  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
   erb render_markdown(content)
  end
  # when ".md"
  #   erb render_markdown(content)
  # else
  #   headers["Content-Type"] = "text/plain"
  #   content
  # end
end

def require_signed_in_user
  unless session[:signed_in]
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end


get "/" do

  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  erb :index
end

get "/new" do
  require_signed_in_user

  erb :new_file
end

post "/new/file" do
  require_signed_in_user

  filename = params[:filename].to_s.strip

  if filename.empty?
    session[:message] = "A name is required"
    status 442
    erb :new_file
  elsif !filename.include?(".")
    session[:message] = "Must include a file extension"
    status 442
    erb :new_file
  else
    file_path = File.join(data_path, filename)

    File.write(file_path, "")
    session[:message] = "#{params[:filename]} has been created."

    redirect "/"
  end
end

get "/login" do
  erb :login
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

post "/login/go" do
  # credentials = load_user_credentials
  @username = params[:username]

  @password = params[:password]

  # if credentials.key?(@username) && credentials[@username] == params[:password]
  # if @username == "admin" && @password == "secret"
  if valid_credentials?(@username, params[:password])
    session[:username] = @username
    session[:signed_in] = true
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid credentials"
    status 422
    erb :login
  end
end

post "/logout" do
  session[:signed_in] = false
  @username = ""
  @password = ""
  session[:message] = "You have been signed out."
  redirect "/"
end

get "/view" do
# get "/:filename" do
  file_path = File.join(data_path, File.basename(params[:filename]))

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist"
    redirect "/"
  end
end

get "/:filename/edit" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])
  @filename = params[:filename]
  @text = File.read(file_path)

  erb :edit
end

post "/:filename" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

post "/:filename/delete" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])
  File.delete(file_path)

  # if session[:signed_in] == false
  #   session[:message] = "Must be signed in to perform this action."
  # else
    session[:message] = "#{params[:filename]} has been deleted."
  # end

  redirect "/"
end


#3 show list of files in the cms
=begin
- create a directory for files
- somehow get the files into an array object that contains the names of the files
- print the array elements to the screen
=end

#4 - viewing txt files
=begin
- add links to each file name that goes to a page - example /history.txt
- add a new route that corresponds to this file name
- in the new route, display the contents of the file

=end

