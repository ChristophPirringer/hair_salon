require("spec_helper")

describe(Client) do

	describe(".all") do
		it("is empty at first") do
			expect(Client.all()).to(eq([]))
		end
	end

end

	describe("#save") do
		it("adds a client to the array of saved clients") do
			test_client = Client.new({:client_name => "Bob", :stylist_id => 1, :id => nil})
			test_client.save()
			expect(Client.all()).to(eq([test_client]))
		end
	end

	describe("#client_name") do
		it("lets you give a client_name") do
			test_client = Client.new({:client_name => "Bob", :stylist_id => 1, :id => nil})
			expect(test_client.client_name()).to(eq("Bob"))
		end


	describe("#stylist_id") do
		it("lets you read the stylist ID out") do
			test_client = Client.new({:client_name => "Bob", :stylist_id => 1, :id => nil})
			expect(test_client.stylist_id()).to(eq(1))
		end
	end

	describe("#==") do
		it("is the same client if it has the same client_name") do
			test_client1 = Client.new({:client_name => "Bob", :stylist_id => 1, :id => nil})
			test_client2 = Client.new({:client_name => "Bob", :stylist_id => 1, :id => nil})
			expect(test_client1).to(eq(test_client2))
		end
	end

end
