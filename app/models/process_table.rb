class ProcessTable
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :server, inverse_of: :process_tables

  embeds_many :process_table_items, inverse_of: :process_table
  accepts_nested_attributes_for :process_table_items

  validates :server, presence: true
end
