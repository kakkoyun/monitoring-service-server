require 'rails_helper'

RSpec.describe DiskUsage, type: :model do
  it { is_expected.to be_timestamped_document }

  it "has a valid factory" do
    expect(build(:disk_usage)).to be_valid
  end

  context "associations" do
    it "belong to server" do
      is_expected.to belong_to(:server).as_inverse_of(:disk_usages)
    end
  end

  context "validations" do
    it "is invalid without a server" do
      expect(build(:disk_usage, server: nil)).not_to be_valid
    end

    it "is invalid without an amount" do
      expect(build(:disk_usage, amount: nil)).not_to be_valid
    end

    it "is invalid without a ratio" do
      expect(build(:disk_usage, amount: nil)).not_to be_valid
    end
  end
end
