require 'rails_helper'

RSpec.describe "DiskUsages", type: :request do
  describe "POST /disk_usages" do

    let!(:access_token) { FactoryGirl.create(:access_token) }
    let!(:server) { FactoryGirl.create(:server, application: access_token.application) }
    let!(:disk_usage) { FactoryGirl.build(:disk_usage, server: server) }

    it "creates a Disk Usage with valid parameters" do
      expect { post api_v1_disk_usages_path,
                    disk_usage:   disk_usage.attributes,
                    format:       :json,
                    access_token: access_token.token }.to change(DiskUsage, :count).by(1)
    end

    it "creates a Disk Usage with given parameters" do
      expect { post api_v1_disk_usages_path,
                    disk_usage:   disk_usage.attributes,
                    format:       :json,
                    access_token: access_token.token }.to change(DiskUsage, :count).by(1)
      expect(DiskUsage.last.amount).to eq disk_usage.amount
    end

    it "succeeded and return 201 with valid parameters" do
      post api_v1_disk_usages_path,
           disk_usage:   disk_usage.attributes,
           format:       :json,
           access_token: access_token.token
      expect(response).to have_http_status(201)
    end

    it "fails and return 406 with wrong format and return proper status code" do
      post api_v1_disk_usages_path,
           disk_usage:   disk_usage.attributes,
           format:       :html,
           access_token: access_token.token
      expect(response).to have_http_status(406)
    end

    it "fails and return 422 with invalid params" do
      post api_v1_disk_usages_path,
           disk_usage:   {},
           format:       :json,
           access_token: access_token.token
      expect(response).to have_http_status(422)
    end

    it "fails and return 401 with invalid token" do
      post api_v1_disk_usages_path,
           disk_usage:   {},
           format:       :json,
           access_token: "invalid_token"
      expect(response).to have_http_status(401)
    end
  end
end
