module Concerns
  module ApiAuthentication
    extend ActiveSupport::Concern

    included do
      before_action :doorkeeper_authorize!
    end
  end
end
