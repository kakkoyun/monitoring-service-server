class Server
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :public_ip, type: String

  belongs_to :application, class_name: Doorkeeper::Application.name

  has_many :cpu_usages, inverse_of: :server, dependent: :destroy
  has_many :disk_usages, inverse_of: :server, dependent: :destroy
  has_many :process_tables, inverse_of: :server, dependent: :destroy

  validates :name, presence: true
  validates :application, presence: true
  validates :public_ip, presence: true

  def to_s
    name
  end
end
