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
end
