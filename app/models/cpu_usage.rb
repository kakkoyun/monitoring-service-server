class CpuUsage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :amount, type: BigDecimal

  belongs_to :server, inverse_of: :cpu_usages

  validates :server, presence: true
  validates :amount, presence: true
end
