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

end
