require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"}) #for use
# DB = PG.connect({:dbname => "to_salon_test"}) #for testing

get("/") do
	erb(:index)
end
