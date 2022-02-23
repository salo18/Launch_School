require 'socket'

def parse_request(request_line)
  method, path_and_params, http = request_line.split
  path, params = path_and_params.split("?")

  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value.to_i
  end

  [method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  next unless request_line
  # LS version
  method, path, params = parse_request(request_line)

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number+1}'>Add one</a>"
  client.puts "<a href='?number=#{number-1}'>Subtract one</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end


  # client.puts "<h1>Rolls!<h1>"

  # rolls = params["rolls"].to_i
  # sides = params["sides"].to_i

  # rolls.times do
  #   roll = rand(sides) + 1
  #   client.puts "<p>", roll, "<p>"
  # end





  # First attempt

  # a = request_line.split

  # fake_path = a[1]

  # if fake_path.include?("?")
  #   n = a[1].chars.index("?")
  #   path = a[1][0...n]
  #   fake_params = a[1][n+1..-1]
  # end

  # b = fake_params.chars.index("&")
  # hashy1 = fake_params[0...b]
  # hashy2 = fake_params[b+1..-1]
  # find_kv(hashy1)
  # hash = {find_kv(hashy1)[0] => find_kv(hashy1)[1], find_kv(hashy2)[0] => find_kv(hashy2)[1] }

  # # p hash["sides" ]

  # client.puts rand(hash["sides"]) + 1