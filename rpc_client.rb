require 'xmlrpc/client'

server = XMLRPC::Client.new('localhost', '/rpc_server', 3000)

gender = 'm'
height = 1.76

begin
  ideal_weight = server.call('ideal_weight', gender, height)
  puts "Ideal weight (gender: '#{gender}', height: #{height} m) = #{ideal_weight}"
rescue XMLRPC::FaultException => e
  puts 'Error:'
  puts e.faultCode
  puts e.faultString
end