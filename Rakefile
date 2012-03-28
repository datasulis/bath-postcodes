require 'rubygems'
require 'rake'
require 'rake/clean'

DATA_DIR="data"

CLEAN.include ["#{DATA_DIR}/*.csv","#{DATA_DIR}/*.json"]

task :postcodes_to_csv do
  sh %{ruby bin/postcodes-to-csv.rb}
end

task :postcodes_to_json do
  sh %{ruby bin/postcodes-to-json.rb}
end

task :download => [:postcodes_to_csv, :postcodes_to_json]