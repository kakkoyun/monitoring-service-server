FactoryGirl.define do
  factory :process_table_item do
    cpu_usage_amount { Faker::Number.decimal(2) }
    name { Faker::StarWars.characters }
    process_table
  end
end
