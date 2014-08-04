require 'rubygems'
require 'json'
require 'net/http'
require 'cgi'

dir = File.dirname(__FILE__)

query = File.read( File.join(dir, "..", "rq", "list-banes-postcode-units.rq") )

Net::HTTP.start('data.ordnancesurvey.co.uk') do |http|
  req = Net::HTTP::Get.new("/datasets/os-linked-data/apis/sparql?output=json&query=#{CGI.escape(query)}") 
  response = http.request(req)
  postcodes = JSON.parse( response.body )
  output = {
    "postcodes" => []
  }
  postcodes["results"]["bindings"].each do |postcode|
    output["postcodes"] << {      
      "postcode" => postcode["postcode"]["value"],
      "uri" => postcode["uri"]["value"],
      "centroid" => {
        "latitude" => postcode["latitude"]["value"], 
        "longitude" => postcode["longitude"]["value"],        
      },
      "ward_uri" => postcode["ward_uri"]["value"],
      "ward_name" => postcode["ward_name"]["value"]        
    }
  end
  File.open( File.join(dir, "..", "data", "banes-postcodes.json"), "w") do |file|
    file.puts JSON.pretty_generate(output)
  end
end
