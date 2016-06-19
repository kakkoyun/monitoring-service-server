module Concerns
  module ApiErrorHandling
    extend ActiveSupport::Concern

    included do
      rescue_from StandardError, with: :internal_server_error
    end

    def internal_server_error(exception)
      render status: :internal_server_error, json: { messages: { "#{params[:controller]}".freeze => exception.message } }
    end
  end
end
