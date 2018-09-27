
require "xmlrpc/client"

CEP = "17527350"
NUM1 = 43
NUM2 = 18

server = XMLRPC::Client.new("localhost",'/', 8080)
begin
  param = server.call("sabatine.sum", NUM1, NUM2)
  puts "#{NUM1} + #{NUM2} = #{param}"
  resp = server.call("sabatine.cep", CEP)
  puts "#{CEP} = #{resp}"
rescue XMLRPC::FaultException => e
  puts "Error:"
  puts e.faultCode
  puts e.faultString
end