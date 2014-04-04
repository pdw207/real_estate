require 'spec_helper'

describe Owner do
    context 'validations' do
    let (:blank){[nil, ""]}

    it {should have_valid(:first_name).when("Bob", "Jane")}
    it {should_not have_valid(:first_name).when(*blank)}

    it {should have_valid(:last_name).when("O'Rillio", "Peterson")}
    it {should_not have_valid(:last_name).when(*blank)}

    it {should have_valid(:email).when("asdf@asdf.com", "asdfasdfsdf")}
    it {should_not have_valid(:email).when(*blank)}

  end

  context 'associations' do
    it {should have_many(:buildings)}

  end

  context 'methods' do

    it 'responds to full_name method' do
      person = FactoryGirl.build(:owner, first_name: 'Go', last_name: 'Mon')
      expect(person.full_name).to eq("Go Mon")
    end

    it 'can delete related buildings' do

      # Create some data
      owner  = FactoryGirl.create(:owner)
      building  = FactoryGirl.build(:building)

      # Add a related building
      owner.buildings << building

      #expect to have related building
      expect(building.owner_id).to eq(owner.id)

      owner.delete_buildings

      # Now relationships destroyed
      expect(building.owner_id).to eq(nil)



    end
  end
end
