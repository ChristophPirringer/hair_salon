require('capybara/rspec')
require('./app')
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('adding a new stylist', {:type => :feature}) do
	it('allows a user to add a new stylist and see it on the stylist-listing') do
		visit('/')
		click_link('Add New Brilliant Stylist!')
		fill_in('name', :with => 'JeanJaque')
		click_button('Add Stylist!')
		expect(page).to have_content('JeanJaque')
	end
end

describe('removing all stylists', {:type => :feature}) do
  it('allows a user to remove all stylists from the database') do
    visit('/')
    click_link('Add New Brilliant Stylist!')
    fill_in('name', :with => 'JeanJaque')
    click_button('Add Stylist!')
    click_link('Fire the lot!')
    click_link('View All Our Brilliant Stylists!')
    expect(page).to have_no_content('JeanJaque')
  end
end
