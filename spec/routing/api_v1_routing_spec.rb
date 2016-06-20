require "rails_helper"

RSpec.describe "API V1 routing" do

  describe Api::V1::CpuUsagesController, type: :routing do

    it "routes to cpu_usage#create" do
      expect(post: "api/v1/cpu_usages").to route_to("api/v1/cpu_usages#create")
    end
  end
end
