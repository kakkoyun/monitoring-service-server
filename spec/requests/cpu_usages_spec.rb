require 'rails_helper'

RSpec.describe "CpuUsages", type: :request do
  describe "POST /cpu_usages" do

    let!(:access_token) { FactoryGirl.create(:access_token) }
    let!(:server) { FactoryGirl.create(:server, application: access_token.application) }
    let!(:cpu_usage) { FactoryGirl.build(:cpu_usage, server: server) }

    it "creates a Cpu Usage with valid parameters" do
      expect { post api_v1_cpu_usages_path,
                    cpu_usage:    cpu_usage.attributes,
                    format:       :json,
                    access_token: access_token.token }.to change(CpuUsage, :count).by(1)
    end

    it "creates a Cpu Usage with given parameters" do
      expect { post api_v1_cpu_usages_path,
                    cpu_usage:    cpu_usage.attributes,
                    format:       :json,
                    access_token: access_token.token }.to change(CpuUsage, :count).by(1)
      expect(CpuUsage.last.amount).to eq cpu_usage.amount
    end

    it "succeeded and return 201 with valid parameters" do
      post api_v1_cpu_usages_path,
           cpu_usage:    cpu_usage.attributes,
           format:       :json,
           access_token: access_token.token
      expect(response).to have_http_status(201)
    end

    it "fails and return 406 with wrong format and return proper status code" do
      post api_v1_cpu_usages_path,
           cpu_usage:    cpu_usage.attributes,
           format:       :html,
           access_token: access_token.token
      expect(response).to have_http_status(406)
    end

    it "fails and return 422 with invalid params" do
      post api_v1_cpu_usages_path,
           cpu_usage:    {},
           format:       :html,
           access_token: access_token.token
      expect(response).to have_http_status(422)
    end

    it "fails and return 401 with invalid token" do
      post api_v1_cpu_usages_path,
           cpu_usage:    {},
           format:       :html,
           access_token: "invalid_token"
      expect(response).to have_http_status(401)
    end
  end
end
