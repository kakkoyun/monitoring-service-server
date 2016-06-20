FactoryGirl.define do

  factory :disk_usage do
    server { FactoryGirl.create(:server) }
    server_id { server.id }
    amount { Faker::Number.positive }
    ratio { Faker::Number.decimal(2) }
  end
end
