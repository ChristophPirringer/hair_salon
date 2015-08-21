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
			test_client = Client.new({:client_name => "Bob", :stylist_id => 1})
			test_client.save()
			expect(Client.all()).to(eq([test_client]))
		end
	end

	describe("#client_name") do
		it("lets you give a client_name") do
			test_client = Client.new({:client_name => "Bob", :stylist_id => 1})
			expect(test_client.client_name()).to(eq("Bob"))
		end
	end
