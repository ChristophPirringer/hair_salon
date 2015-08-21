require("spec_helper")

describe(Stylist) do

	describe("#name") do
		it("tells you the name") do
			stylist = Stylist.new({:name => "Jean", :id => nil})
			expect(stylist.name()).to(eq("Jean"))
		end
	end

	describe(".all") do
		it("starts off with no lists") do
			expect(Stylist.all()).to(eq([]))
		end
	end

	describe("#save") do
		it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Jean", :id => nil})
			stylist.save()
			expect(Stylist.all()).to(eq([stylist]))
		end
	end

	describe("#==") do
		it("is the same stylist if they have the same name") do
			stylist1 = Stylist.new({:name => "Jean", :id => nil})
			stylist2 = Stylist.new({:name => "Jean", :id => nil})
			expect(stylist1).to(eq(stylist2))
		end
	end

  	describe(".find") do
		it("returns a stylist by its ID") do
			test_stylist = Stylist.new({:name => "Jean", :id => nil})
			test_stylist.save()
			test_stylist2 = Stylist.new({:name => "Jaque", :id => nil})
			test_stylist2.save()
			expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
		end
	end

  	describe("#clients") do
		it("returns an array of clients for that stylist") do
			test_stylist = Stylist.new({:name => "Jean", :id => nil})
			test_stylist.save()
			test_client = Client.new({:client_name => "Peter", :stylist_id => test_stylist.id(), :id => nil})
			test_client.save()
			test_client2 = Client.new({:client_name => "Paul", :stylist_id => test_stylist.id(), :id => nil})
			test_client2.save()
			expect(test_stylist.clients()).to(eq([test_client, test_client2]))
		end
	end

	describe '#destroy' do
    it 'it removes stylist from the database' do
      test_stylist = Stylist.new({:name => "Jean", :id => nil})
			test_stylist.save()
      test_stylist.destroy
      @stylists = Stylist.all
      expect(@stylists.include?(test_stylist)).to eq false
    end
  end

	 describe '#update' do
    it 'it returns stylist with new name' do
      test_stylist = Stylist.new({:name => "Jean", :id => nil})
			test_stylist.save()
      test_stylist.update({name: 'Blain'})
      expect(test_stylist.name).to eq "Blain"
    end
	end

end
