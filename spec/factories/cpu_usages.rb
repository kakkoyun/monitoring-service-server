require 'faker'

FactoryGirl.define do

  factory :cpu_usage do
    server
    amount { Faker::Number.decimal(2) }
  end
end
