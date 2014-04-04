
require 'spec_helper'

feature 'user creates owner', %w{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria:
  # ----------------
  # * When recording a building, I want to optionally associate the building with its rightful owner.
  # * If I delete an owner, the owner and its primary key should no longer be associated with any properties.



    scenario ' I can add a building to an owner' do

    beg_building_count = Building.count
    owner = FactoryGirl.build(:owner)

    building = FactoryGirl.build(:building)

    visit root_path
    click_link 'Create a Building'
    fill_in 'Street Address', with: building.street
    fill_in 'City', with: building.city
    fill_in 'State', with: building.state
    select(owner.full_name, :from => 'Owner')
    fill_in 'Postal Code', with: building.zip_code
    fill_in 'Description', with: building.description
    click_button 'Create Building'

    expect(Owner.last.buildings.count).to eq(1)


  end

  scenario 'I can delete a owner' do

    owner_count = Owner.count
    visit new_owner_path

    # Create
    fill_in 'First Name', with: 'GOGO'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'bsmith@abccleaners.com'
    fill_in 'Company', with: 'ABC Cleaners'
    click_button 'Create an Owner'

    # Destroy
    visit owners_path
    click_link 'Destroy - GOGO'

    # No Change
    expect(Owner.count).to eq(owner_count)


  end

end






