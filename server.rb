require "xmlrpc/server"
require 'net/http'

s = XMLRPC::Server.new(8080)

s.add_handler("sabatine.sum") do |a,b|
  a + b
end

s.add_handler("sabatine.cep") do |cep|
  uri = URI.parse("http://viacep.com.br/ws/#{cep}/json")
	Net::HTTP.get(uri).to_s
end

s.set_default_handler do |name, *args|
  raise XMLRPC::FaultException.new(-99, "Method #{name} missing" +
                                   " or wrong number of parameters!")
end

puts "antes do server"
s.serve
puts "depois do server"
