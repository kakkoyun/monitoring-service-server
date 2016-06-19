class Api::V1::BaseController < ActionController::Base
  include Concerns::ApiErrorHandling

  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!

  respond_to :json
end
