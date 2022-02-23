require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

# get "/" do
#   File.read "public/template.html"
#   # "Hello World!"
# end

# bundle exec ruby book_viewer.rb

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @contents = File.readlines("data/toc.txt")
  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @contents= File.readlines("data/toc.txt")
  @chapter = File.read("data/chp1.txt")
  erb :chapter
end

get "/show/:name" do
  params[:name]
end