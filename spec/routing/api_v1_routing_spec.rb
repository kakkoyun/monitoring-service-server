require "rails_helper"

RSpec.describe "API V1 routing" do

  describe Api::V1::CpuUsagesController, type: :routing do

    it "routes to cpu_usage#create" do
      expect(post: "api/v1/cpu_usages").to route_to("api/v1/cpu_usages#create")
    end

    it "routes to disk_usage#create" do
      expect(post: "api/v1/disk_usages").to route_to("api/v1/disk_usages#create")
    end

    it "routes to process_table#create" do
      expect(post: "api/v1/process_tables").to route_to("api/v1/process_tables#create")
    end
  end
end
