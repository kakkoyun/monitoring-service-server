module Concerns
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_user!
    end

    def after_sign_in_path_for(resource)
      if request.referer == new_user_session_url
        super
      else
        stored_location_for(resource).presence || params[:redirect_to] || root_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
  end
end
