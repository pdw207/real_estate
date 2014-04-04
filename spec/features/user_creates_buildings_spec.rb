require 'spec_helper'

feature 'user creates building', %w{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:
# ----------------
# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format, the building is recorded.
# * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# * Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'user successfully creates building' do

    beg_building_count = Building.count

    building = FactoryGirl.build(:building)
    visit root_path
    click_link 'Create a Building'
    fill_in 'Street Address', with: building.street
    fill_in 'City', with: building.city
    fill_in 'State', with: building.state
    fill_in 'Postal Code', with: building.zip_code
    fill_in 'Description', with: building.description
    click_button 'Create Building'

    expect(page).to have_content('You have Successfully Added a Building')
    expect(Building.count).to eq(beg_building_count + 1)

    # Has The link we need for the user to create a new building
    expect(page).to have_content('Create a Building')
  end

  scenario 'user is not successfull creating a new building' do

    beg_building_count = Building.count

    visit new_building_path
    click_button 'Create Building'

    expect(page).to have_content('You were Unsuccessful.')
    expect(Building.count).to eq(beg_building_count)
  end

  scenario 'user wants to view all buildings' do
    FactoryGirl.create_list(:building, 10, street: "918 Oak Street")
    building_count = Building.count
    visit root_path
    click_link 'View All Buildings'
    expect(page).to have_content("918 Oak Street")

  end
end
