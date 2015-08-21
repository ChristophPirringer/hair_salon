require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon"}) #for use
# DB = PG.connect({:dbname => "to_salon_test"}) #for testing


##########################
#####___Index-page___#####
##########################
get("/") do
	erb(:index)
end


##########################
###___Stylist-Listing___###
##########################
get("/stylists") do
	@stylists = Stylist.all()
	erb(:stylists)
end

get("/clear") do
	DB.exec("DELETE FROM stylists;")
	erb(:index)
end


##########################
###___Client-Listing___###
##########################
get("/clients") do
	@clients = Client.all()
	erb(:clients)
end


##########################
#####___New-Stylist___####
##########################
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

##########################
####___Stylist-Entry___###
##########################
get("/stylists/:id") do
	@stylist = Stylist.find(params.fetch("id").to_i())
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


##########################
#####___New-Client___#####
##########################
get("/clients/:id") do
	@stylist = params.fetch("id").to_i()
	erb(:client_form)
end

post("/clients/:id") do
	client_name = params.fetch("client_name")
	stylist_id = params.fetch("id").to_i()
	@stylist = Stylist.find(stylist_id)
	@client = Client.new({:client_name => client_name, :stylist_id => stylist_id})
	@client.save()
	erb(:stylist)
end


##########################
####___Client-Entry___####
##########################
get("/client/:id") do
	@client = Client.find(params['id'].to_i)
	erb(:client)
end

delete '/clients/:id/delete' do
	@client = Client.find(params['id'].to_i)
	@client.destroy
	@clients = Client.all()
	erb(:stylist)
end

patch '/clients/:id' do
	@client = Client.find(params['id'].to_i)
	@client.update({client_name: params['client_name']})
	@clients = Client.all()
	erb(:stylist)
end
