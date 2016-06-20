FactoryGirl.define do
  factory :process_table do
    server
    after(:build) do |table, evaluator|
      build_list(:process_table_item, 10, process_table: table)
    end
  end
end
