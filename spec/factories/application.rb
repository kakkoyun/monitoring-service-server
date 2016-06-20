require 'faker'

FactoryGirl.define do
  factory :application, class: Doorkeeper::Application do |application|
    id { Faker::Crypto.sha1 }
    created_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    name Faker::StarWars.vehicle
    redirect_uri 'urn:ietf:wg:oauth:2.0:oob'
    scopes ''
    secret { Faker::Crypto.sha1 }
    uid { Faker::Crypto.sha256 }
    updated_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
