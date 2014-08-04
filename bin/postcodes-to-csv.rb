require 'rubygems'
require 'json'
require 'net/http'
require 'cgi'
require 'csv'

dir = File.dirname(__FILE__)

query = File.read( File.join(dir, "..", "rq", "list-banes-postcode-units.rq") )

Net::HTTP.start('data.ordnancesurvey.co.uk') do |http|
  req = Net::HTTP::Get.new("/datasets/os-linked-data/apis/sparql?output=csv&query=#{CGI.escape(query)}") 
  response = http.request(req)
  File.open( File.join(dir, "..", "data", "banes-postcodes.csv"), "w") do |f|
    f.puts response.body
  end
end
