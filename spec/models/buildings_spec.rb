require 'spec_helper'


describe Building do

  context 'validations' do
    let (:blank){[nil, ""]}

    it {should have_valid(:street).when("34 Mulligan Drive")}
    it {should_not have_valid(:street).when(*blank)}

    it {should have_valid(:city).when("Boston", "New York")}
    it {should_not have_valid(:city).when(*blank)}

    it {should ensure_inclusion_of(:state).in_array(Building::STATES)}

    it {should have_valid(:zip_code).when("24341","2313-24341")}
    it {should_not have_valid(:zip_code).when(*blank)}
  end

end
