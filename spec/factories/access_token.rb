require 'faker'

FactoryGirl.define do

  factory :access_token, class: Doorkeeper::AccessToken do
    application { FactoryGirl.create(:application) }
  end
end
