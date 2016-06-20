class ProcessTableItem
  include Mongoid::Document

  field :name, type: String
  field :cpu_usage_amount, type: BigDecimal

  embedded_in :process_table, inverse_of: :process_table_items

  validates :process_table, presence: true
  validates :name, presence: true
  validates :cpu_usage_amount, presence: true
end
