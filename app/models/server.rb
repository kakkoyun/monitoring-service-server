class Server
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :public_ip, type: String

  belongs_to :application, class_name: Doorkeeper::Application.name

  validates :name, presence: true
  validates :application, presence: true

  def to_s
    name
  end
end
