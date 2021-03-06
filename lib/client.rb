class Client
	attr_reader(:client_name, :stylist_id, :id)

	define_method(:initialize) do |attributes|
		@client_name = attributes.fetch(:client_name)
		@stylist_id = attributes.fetch(:stylist_id)
		@id = attributes.fetch(:id)
	end

	define_singleton_method(:all) do
		returned_clients = DB.exec("SELECT * FROM clients;")
		clients = []
		returned_clients.each() do |client|
			client_name = client.fetch("client_name")
			stylist_id = client.fetch("stylist_id").to_i()
			id = client.fetch("id").to_i
			clients.push(Client.new({:client_name => client_name, :stylist_id => stylist_id, :id => id}))
		end
		clients
	end

  define_method(:save) do
		result = DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id}) RETURNING id;")
		@id = result.first().fetch("id").to_i()
	end

	define_method(:==) do |another_client|
		self.client_name().==(another_client.client_name()).&(self.stylist_id().==(another_client.stylist_id()))
	end

	define_singleton_method(:find) do |id|
		found_client = nil
		Client.all().each() do |client|
			if client.id().==(id)
				found_client = client
			end
		end
		found_client
	end

	def destroy
		DB.exec("DELETE FROM clients WHERE id = #{self.id};")
	end

	def update(attributes)
		@client_name = attributes.fetch(:client_name, @client_name)
		DB.exec("UPDATE clients SET client_name = '#{@client_name}' WHERE id = #{self.id};")
	end

end
