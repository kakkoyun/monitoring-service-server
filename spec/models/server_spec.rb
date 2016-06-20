require 'rails_helper'

RSpec.describe Server, type: :model do
  it { is_expected.to be_timestamped_document }

  it "has a valid factory" do
    expect(FactoryGirl.build(:server)).to be_valid
  end

  context "associations" do
    it "belong to application" do
      is_expected.to belong_to(:application)
    end

    it "have many cpu usages" do
      is_expected.to have_many(:cpu_usages).with_dependent(:destroy)
    end
  end

  context "validations" do
    it "is invalid without a name" do
      expect(FactoryGirl.build(:server, name: nil)).not_to be_valid
    end

    it "is invalid without an application" do
      expect(FactoryGirl.build(:server, application: nil)).not_to be_valid
    end

    it "is invalid without an public_ip" do
      expect(FactoryGirl.build(:server, public_ip: nil)).not_to be_valid
    end
  end
end
