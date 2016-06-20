require 'rails_helper'

RSpec.describe Server, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:server)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:server, name: nil)).not_to be_valid
  end

  it "is invalid without an application" do
    expect(FactoryGirl.build(:server, application: nil)).not_to be_valid
  end

  it "belongs_to application" do
    is_expected.to belong_to(:application)
  end

  it "has a public_ip field" do
    is_expected.to have_field(:public_ip).of_type(String)
  end

  it { is_expected.to be_timestamped_document }
end
