module Concerns
  module ApiErrorHandling
    extend ActiveSupport::Concern

    included do
      rescue_from StandardError, with: :internal_server_error if Rails.env.production?
      rescue_from ActionController::UnknownFormat, with: :not_acceptable
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
    end

    def internal_server_error(exception)
      render status: :internal_server_error, json: { messages: { "#{params[:controller]}".freeze => exception.message } }
    end

    def not_acceptable
      render status: :not_acceptable, json: { messages: { "message": "Ensure you provided proper format." } }
    end

    def parameter_missing
      render status: :unprocessable_entity, json: { messages: { "message": "Ensure you provided required parameters." } }
    end
  end
end
