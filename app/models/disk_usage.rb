class DiskUsage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :amount, type: BigDecimal
  field :ratio, type: BigDecimal

  belongs_to :server, inverse_of: :disk_usages

  validates :server, presence: true
  validates :amount, presence: true
  validates :ratio, presence: true
end
