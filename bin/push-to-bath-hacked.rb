require 'soda/client'
require 'json'

dir = File.dirname(__FILE__)     

data = JSON.parse( File.read( File.join(dir, "..", "data", "banes-postcodes.json") ) )      

dataset = ENV["SOCRATA_DATASET"]

client = SODA::Client.new({:domain => "bath.azure-westeurope-prod.socrata.com",
                           :username => ENV["SOCRATA_USER"],
                           :password => ENV["SOCRATA_PASS"],
                           :app_token => ENV["SOCRATA_APP_TOKEN"]})
                        

response = client.post( dataset, data["postcodes"].entries )
