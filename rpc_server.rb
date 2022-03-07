require 'xmlrpc/server'

server = XMLRPC::Server.new(3000)

server.add_handler('ideal_weight') do |gender, height|
  case gender
  when 'f'
    ((62.1 * height) - 44.7).round(3)
  when 'm'
    ((72.7 * height) - 58).round(3)
  else
    raise XMLRPC::FaultException.new(1, 'Invalid gender or height')
  end
end

server.set_default_handler do |name, *args|
  raise XMLRPC::FaultException.new(-99, "Method #{name} or wrong number of parameters!")
end

server.serve
#