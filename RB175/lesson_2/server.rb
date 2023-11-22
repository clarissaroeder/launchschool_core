require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  client.puts "HTTP/1.1 200 OK\r\n\r\n"

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  client.puts request_line
  client.close
end