require 'faker'

FactoryGirl.define do
  factory :server, class: Server do |server|
    name Faker::StarWars.planet
    application { FactoryGirl.create(:application) }
    application_id { application.id }
  end
end
