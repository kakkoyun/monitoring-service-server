require 'faker'

FactoryGirl.define do

  factory :cpu_usage do
    server { FactoryGirl.create(:server) }
    server_id { server.id }
    amount { Faker::Number.decimal(2) }
  end
end
