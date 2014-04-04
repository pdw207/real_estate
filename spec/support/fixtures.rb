
FactoryGirl.define do

  factory :building do
    sequence(:street, 100) { |n| "#{n} Washignton Ave" }
    city 'Brooklyn'
    state 'NY'
    zip_code '11201'
    description '4 Family Duplex'
  end

end
