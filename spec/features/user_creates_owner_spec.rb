require 'spec_helper'

feature 'user creates owner', %w{
As a real estate associate
I want to record a building owner
So that I can keep track of our relationships with owners
} do

# Acceptance Criteria:
# ----------------
# * I must specify a first name, last name, and email address
# * I can optionally specify a company name
# * If I do not specify the required information, I am presented with errors
# * If I specify the required information, the owner is recorded and I am redirected to enter another new owner


  scenario 'user successfully creates owner' do

    beg_owner_count = Owner.count

    visit root_path

    click_link 'Create a New Owner'

    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'bsmith@abccleaners.com'
    fill_in 'Company', with: 'ABC Cleaners'
    click_button 'Create an Owner'

    expect(page).to have_content('You have Successfully Added an Owner')
    expect(Owner.count).to eq(beg_owner_count + 1)
  end

  scenario 'user successfully creates owner' do

    beg_owner_count = Owner.count

    visit new_owner_path
    click_button 'Create an Owner'

    expect(page).to have_content('You were Unsuccessful in Creating an Owner.')
    expect(Owner.count).to eq(beg_owner_count)
  end

  scenario 'user wants to view all owners' do
    FactoryGirl.create(:owner, first_name: "Bob")
    FactoryGirl.create_list(:owner, 10)
    owner_count = Owner.count
    visit root_path
    click_link 'View All Owners'
    expect(page).to have_content('Bob')

  end


end
