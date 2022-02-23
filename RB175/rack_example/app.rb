require_relative 'advice'     # loads advice.rb
require_relative 'monroe'

class App < Monroe
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      response(status, headers) do
        erb :index
      end
    when '/advice'
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      piece_of_advice = Advice.new.generate
      response(status, headers) do
        erb :advice, message: piece_of_advice
      end
    else
      status = '404'
      headers = {"Content-Type" => 'text/html', "Content-Length" => '61'}
      response(status, headers) do
        erb :not_found
      end
    end
  end
end



# class App
#   def call(env)
#     case env['REQUEST_PATH']
#     when '/'
#       status = '200'
#       headers = {"Content-Type" => 'text/html'}
#       response(status, headers) do
#         erb :index
#       end
#     when '/advice'
#       piece_of_advice = Advice.new.generate
#       status = '200'
#       headers = {"Content-Type" => 'text/html'}
#       response(status, headers) do
#         erb :advice, message: piece_of_advice
#       end
#     else
#       status = '404'
#       headers = {"Content-Type" => 'text/html', "Content-Length" => '61'}
#       response(status, headers) do
#         erb :not_found
#       end
#     end
#   end

#   def response(status, headers, body = '')
#     body = yield if block_given?
#     [status, headers, [body]]
#   end


#   private
#   def erb(filename, local = {})
#     b = binding
#     message = local[:message]
#     content = File.read("views/#{filename}.erb")
#     ERB.new(content).result(b)
#   end
# end



# class HelloWorld
#   def call(env)
#     case env['REQUEST_PATH']
#     when '/'
#       ['200', {"Content-Type" => "text/html"}, [erb(:index)]]
#     when '/advice'
#       piece_of_advice = Advice.new.generate
#       [
#         '200',
#         {"Content-Type" => 'text/html'},
#         ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]
#       ]
#     else
#       [
#         '404',
#         {"Content-Type" => 'text/html', "Content-Length" => '48'},
#         ["<html><body><h4>404 Not Found</h4></body></html>"]
#       ]
#     end
#   end

#   private

#   def erb(filename, local = {})
#     b = binding
#     message = local[:message]
#     content = File.read("views/#{filename}.erb")
#     ERB.new(content).result(b)
#   end
# end

# class HelloWorld
#   def call(env)
#     case env['REQUEST_PATH']
#     when '/'
#       template = File.read("views/index.erb")
#       content = ERB.new(template)
#       ['200', {"Content-Type" => "text/html"}, [content.result]]
#     when '/advice'
#       piece_of_advice = Advice.new.generate
#       [
#         '200',
#         {"Content-Type" => 'text/html'},
#         ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]
#       ]
#     else
#       [
#         '404',
#         {"Content-Type" => 'text/html', "Content-Length" => '48'},
#         ["<html><body><h4>404 Not Found</h4></body></html>"]
#       ]
#     end
#   end
# end



# class HelloWorld
#   def call(env)
#     case env['REQUEST_PATH']
#     when '/'
#       [
#         '200',
#         {"Content-Type" => 'text/html'},
#         ["<html><body><h2>Hello World!</h2></body></html>"]
#       ]
#     when '/advice'
#       piece_of_advice = Advice.new.generate
#       [
#         '200',
#         {"Content-Type" => 'text/html'},
#         ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]
#       ]
#     else
#       [
#         '404',
#         {"Content-Type" => 'text/html', "Content-Length" => '48'},
#         ["<html><body><h4>404 Not Found</h4></body></html>"]
#       ]
#     end
#   end
# end