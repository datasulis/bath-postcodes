require 'rubygems'
require 'json'
require 'net/http'
require 'cgi'

dir = File.dirname(__FILE__)

query = File.read( File.join(dir, "..", "rq", "list-bath-postcode-units.rq") )

Net::HTTP.start('api.talis.com') do |http|
  req = Net::HTTP::Get.new("/stores/ordnance-survey/services/sparql?output=json&query=#{CGI.escape(query)}") 
  response = http.request(req)
  postcodes = JSON.parse( response.body )
  output = {
    "postcodes" => {}
  }
  postcodes["results"]["bindings"].each do |postcode|
    output["postcodes"][ [ postcode["code"]["value"] ] ] = {
      "id" => postcode["id"]["value"], 
      "latitude" => postcode["latitude"]["value"], 
      "longitude" => postcode["longitude"]["value"]
    }
  end
  File.open( File.join(dir, "..", "data", "bath-postcodes.json"), "w") do |file|
    file.puts JSON.pretty_generate(output)
  end
end
