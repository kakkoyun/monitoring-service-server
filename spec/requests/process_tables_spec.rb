require 'rails_helper'

RSpec.describe "ProcessTables", type: :request do
  describe "POST /process_tables" do

    let!(:access_token) { FactoryGirl.create(:access_token) }
    let!(:server) { FactoryGirl.create(:server, application: access_token.application) }
    let!(:process_table) { FactoryGirl.build(:process_table, server: server) }
    let!(:process_table_attributes) { process_table.attributes.merge(
        { process_table_items_attributes: process_table.process_table_items.map(&:attributes) }
    ) }

    it "creates a Process Table with valid parameters" do
      expect { post api_v1_process_tables_path,
                    process_table: process_table_attributes,
                    format:        :json,
                    access_token:  access_token.token }.to change(ProcessTable, :count).by(1)
    end

    it "creates a Process Table with given parameters" do
      post api_v1_process_tables_path,
           process_table: process_table_attributes,
           format:        :json,
           access_token:  access_token.token
      expect(ProcessTable.last.process_table_items.pluck(:name, :cpu_usage_amount).to_a).to(
          match_array(process_table.process_table_items.pluck(:name, :cpu_usage_amount).to_a)
      )
    end

    it "succeeded and return 201 with valid parameters" do
      post api_v1_process_tables_path,
           process_table: process_table_attributes,
           format:        :json,
           access_token:  access_token.token
      expect(response).to have_http_status(201)
    end

    it "fails and return 406 with wrong format and return proper status code" do
      post api_v1_process_tables_path,
           process_table: process_table_attributes,
           format:        :html,
           access_token:  access_token.token
      expect(response).to have_http_status(406)
    end

    it "fails and return 422 with invalid params" do
      post api_v1_process_tables_path,
           process_table: {},
           format:        :json,
           access_token:  access_token.token
      expect(response).to have_http_status(422)
    end

    it "fails and return 401 with invalid token" do
      post api_v1_process_tables_path,
           process_table: process_table_attributes,
           format:        :json,
           access_token:  "invalid_token"
      expect(response).to have_http_status(401)
    end
  end
end
