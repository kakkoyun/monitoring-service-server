require "application_responder"

class Api::V1::BaseController < ActionController::Base
  include Concerns::ApiErrorHandling

  self.responder = ApplicationResponder
  respond_to :json

  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!

  resource_description do
    api_versions "v1"
  end

  protected

  ##
  # This method returns current application from token.
  def application
    doorkeeper_token.try(:application)
  end

  ##
  # This method returns a Server instance for matching public_ip and application for agent.
  def server
    Server.find_or_create_by(application: application,
                             public_ip:   request.remote_ip)
  end
end
