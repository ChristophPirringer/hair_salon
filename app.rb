require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon"}) #for use
# DB = PG.connect({:dbname => "to_salon_test"}) #for testing

get("/") do
	erb(:index)
end

get("/stylists") do
	@stylists = Stylist.all()
	erb(:stylists)
end

get("/clients") do
	@clients = Client.all()
	erb(:clients)
end

get("/clear") do
	DB.exec("DELETE FROM stylists;")
	erb(:index)
end

get("/stylists/new") do
	erb(:stylist_form)
end

post("/stylists") do
	name = params.fetch("name")
	stylist = Stylist.new({:name => name, :id => nil})
	stylist.save()
  @stylists = Stylist.all()
	erb(:stylists)
end

get("/stylists/:id") do
	@stylist = Stylist.find(params.fetch("id").to_i())
	erb(:stylist)
end

get("/clients/:id") do
	@stylist = params.fetch("id").to_i()
	erb(:add_client)
end

post("/clients/:id") do
	client_name = params.fetch("client_name")
	stylist_id = params.fetch("id").to_i()
	@stylist = Stylist.find(stylist_id)
	@client = Client.new({:client_name => client_name, :stylist_id => stylist_id})
	@client.save()
	erb(:stylist)
end

delete '/stylists/:id/delete' do
	@stylist = Stylist.find(params['id'].to_i)
	@stylist.destroy
	@stylists = Stylist.all()
	erb(:stylists)
end

patch '/stylists/:id' do
	@stylist = Stylist.find(params['id'].to_i)
	@stylist.update({name: params['name']})
	@stylists = Stylist.all()
	erb(:stylists)
end
