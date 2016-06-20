FactoryGirl.define do

  factory :disk_usage do
    server
    amount { Faker::Number.positive }
    ratio { Faker::Number.decimal(2) }
  end
end
