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

get("/stylists") do
	@stylists = Stylist.all()
	erb(:stylists)
end

get("/stylists/new") do
	erb(:stylist_form)
end

post("/lists") do
	name = params.fetch("name")
	stylist = Stylist.new({:name => name, :id => nil})
	stylist.save()
	erb(:stylist_success)
end
