require 'rspec'
require 'pg'
require 'client'
require 'stylist'
require 'pry'

DB = PG.connect({:dbname => "hair_salon_test"}) #used for spec testing
# DB =PG.connect({:dbname => "hair_salon"})

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM stylists *;")
		DB.exec("DELETE FROM clients *;")
	end
end
