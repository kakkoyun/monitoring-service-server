class Server
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :application, class_name: Doorkeeper::Application.name

  def application_id
    application.id
  end
end
