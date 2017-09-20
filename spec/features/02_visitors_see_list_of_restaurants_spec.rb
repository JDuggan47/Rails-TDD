require 'rails_helper'

# [] Visiting the `/restaurants` path should contain a list of restaurants.
# [] Visiting the `/restaurants/10` path should show the restaurant details for a restaurant with the ID of 10.
# [] Visiting the root path should display a list of all restaurants.

feature 'vistor sees a list of all the restaurants' do
  scenario 'visitor sees a list of restaurants and links to them' do
    first_restaurant = FactoryGirl.create(:restaurant)

    visit restaurants_path
    expect(page).to have_content first_restaurant.name

    click_link 'Add Restaurant'
    expect(page).to have_content "New Restaurant Form"
  end

  scenario 'visitor clicks on restaurant name and taken to that page' do
    restaurant = FactoryGirl.create(:restaurant)

    visit root_path

    click_link restaurant.name

    expect(page). to have_content restaurant.name
    expect(page). to have_content restaurant.address
    expect(page). to have_content restaurant.city
    expect(page). to have_content restaurant.state
    expect(page). to have_content restaurant.zip
    expect(page). to have_content restaurant.description
  end
end
