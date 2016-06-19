require "application_responder"

class Api::V1::BaseController < ActionController::Base
  include Concerns::ApiErrorHandling

  self.responder = ApplicationResponder
  respond_to :json

  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!
end
