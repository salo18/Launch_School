require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'erb'

before do
  @contents = File.readlines "data/toc.txt"
end

helpers do
  # def in_paragraphs(str)
  #   str.split("\n\n").map do |line|
  #     "<p> #{line} </p>"
  #   end.join
  # end


  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  # def arr_to_p(arr)
  #   arr.map do |line|
  #     "<a href='/a'>#{line}</a>"
  #   end.join
  # end

  def strong(text, term)
    text.gsub(text, "<strong>#{term}</strong>")

  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end


get "/chapters/:number" do
  @cnumber = params["number"].to_i
  redirect "/" unless (1..@contents.size).cover?(@cnumber)


  @text = File.read "data/chp#{@cnumber}.txt"
  @cname = @contents[@cnumber - 1]
  erb :chapter
end

not_found do
  redirect "/"
end

def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end


def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |paragraph, index|
      matches[index] = paragraph if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any?
  end

  results
end

# def chapters_matching(query)
#   results = []

#   return results unless query #if !query || query.empty?

#   each_chapter do |number, name, contents|
#     results << {number: number, name: name, contents: contents} if contents.include?(query)
#   end

#     results
# end

def find_query(text)
  # text.split(/[.?!]/).select do |ar|
  #   ar.include? params[:query]
  # end
# returns array containing strings where query is matched

  text.split("\n\n").each_with_index.map do |line, index|
    "<p id=paragraph#{index}>#{line}</p>"
  end.select do |a|
    a.include? params[:query]
  end
end

get "/search" do
  # @results = []
  # @text = ""
  # 1.upto(@contents.size) do |i|
  #   @text = File.read "data/chp#{i}.txt"
  #   if @text.include? params[:query]
  #    @results << @contents[i - 1]
  #   end
  # end

  @results = chapters_matching(params[:query])
  erb :search
end





# <ul>
# <% @results.each do |result| %>
#   <li><a href="/chapters/<%= result[:number] %>"><%= result[:name] %></a></li>

#   <%= find_query(result[:contents]) %>
# <% end %>
# </ul>


# search.erb
# <% if params[:query] %>
#   <% if @results.empty? %>
#     <p>Sorry, no matches were found.</p>
#   <% else %>
#     <h2 class="content-subhead">Results for '<%= params[:query]%>'</h2>

#     <ul>
#       <% @results.each do |result| %>
#         <li>
#           <h4><%= result[:name] %></h4>
#           <ul>
#             <% find_query(result[:contents].each do |line| %>
#               <li>
#                 <a href="/chapters/<%= result[:number] %>#paragraph<%= index %>">
#                   <%= line %>
#                 </a>
#               </li>
#             <% end %>
#           </ul>
#         </li>

#       <% end %>
#     </ul>
#   <% end %>
# <% end %>
