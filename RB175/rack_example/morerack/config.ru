class Application
  def call(env)
    handle_request(env['REQUEST_METHOD'], env['PATH_INFO'])
  end

  private

    def handle_request(method, path)
      if method == "GET"
        get(path)
      else
        method_not_allowed(method)
      end
    end

    def get(path)
      [200, { "Content-Type" => "text/html" }, ["You have requested the path #{path}, using GET"]]
    end

    def method_not_allowed(method)
      [405, {}, ["Method not allowed: #{method}"]]
    end
end




# class Application
#   # def call(env)
#   #   status  = 200
#   #   headers = { "Content-Type" => "text/html" }
#   #   body    = ["<html><body><h1>Yay, your first web application! <3</h1></body></html>"]

#   #   [status, headers, body]
#   # end

#   def call(env)
#     p env
#     [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
#   end

# end

# class Application
#   def call(env)
#     puts inspect_env(env)
#     [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
#   end

#   def inspect_env(env)
#     puts format('Request headers', request_headers(env))
#     puts format('Server info', server_info(env))
#     puts format('Rack info', rack_info(env))
#   end

#   def request_headers(env)
#     env.select { |key, value| key.include?('HTTP_') }
#   end

#   def server_info(env)
#     env.reject { |key, value| key.include?('HTTP_') or key.include?('rack.') }
#   end

#   def rack_info(env)
#     env.select { |key, value| key.include?('rack.') }
#   end

#   def format(heading, pairs)
#     [heading, "", format_pairs(pairs), "\n"].join("\n")
#   end

#   def format_pairs(pairs)
#     pairs.map { |key, value| '  ' + [key, value.inspect].join(': ') }
#   end
# end


run Application.new