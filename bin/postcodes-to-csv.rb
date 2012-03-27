require 'rubygems'
require 'json'
require 'net/http'
require 'cgi'
require 'csv'

dir = File.dirname(__FILE__)

query = File.read( File.join(dir, "..", "rq", "list-bath-postcode-units.rq") )

Net::HTTP.start('api.talis.com') do |http|
  req = Net::HTTP::Get.new("/stores/ordnance-survey/services/sparql?output=json&query=#{CGI.escape(query)}") 
  response = http.request(req)
  postcodes = JSON.parse( response.body )   
  CSV.open( File.join(dir, "..", "data", "bath-postcodes.csv"), "w") do |csv|
    postcodes["results"]["bindings"].each do |postcode|
      csv << [ postcode["id"]["value"], postcode["code"]["value"], postcode["latitude"]["value"], postcode["longitude"]["value"] ]
    end
  end
end
