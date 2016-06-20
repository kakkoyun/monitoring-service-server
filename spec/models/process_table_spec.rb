require 'rails_helper'

RSpec.describe ProcessTable, type: :model do
  it { is_expected.to be_timestamped_document }

  it "has a valid factory" do
    expect(FactoryGirl.build(:process_table)).to be_valid
  end

  context "associations" do
    it "belong to server" do
      is_expected.to belong_to(:server).as_inverse_of(:process_tables)
    end

    it { is_expected.to embed_many(:process_table_items) }
  end

  context "validations" do
    it "is invalid without a server" do
      expect(FactoryGirl.build(:process_table, server: nil)).not_to be_valid
    end
  end
end
