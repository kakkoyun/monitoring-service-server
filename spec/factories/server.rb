require 'faker'

FactoryGirl.define do
  factory :server, class: Server do |server|
    name Faker::StarWars.planet
    application { create(:application) }
    public_ip { Faker::Internet.ip_v4_address }

    application_id { application.id }
  end
end
