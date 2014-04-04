
FactoryGirl.define do

  factory :building do
    sequence(:street, 100) { |n| "#{n} Washignton Ave" }
    city 'Brooklyn'
    state 'NY'
    zip_code '11201'
    description '4 Family Duplex'
    owner
  end

  factory :owner do
    first_name "Bob"
    last_name "Smith"
    email "bsmith@consulting.com"
  end

end
