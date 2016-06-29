require 'rails_helper'

RSpec.describe ProcessTableItem, type: :model do

  it "has a valid factory" do
    expect(build(:process_table_item)).to be_valid
  end

  context "associations" do
    it 'embeds in process table' do
      is_expected.to be_embedded_in(:process_table).as_inverse_of(:process_table_items)
    end
  end

  context "validations" do
    it "is invalid without a process table" do
      expect(build(:process_table_item, process_table: nil)).not_to be_valid
    end

    it "is invalid without a name" do
      expect(build(:process_table_item, name: nil)).not_to be_valid
    end

    it "is invalid without an cpu usage amount" do
      expect(build(:process_table_item, cpu_usage_amount: nil)).not_to be_valid
    end
  end
end
