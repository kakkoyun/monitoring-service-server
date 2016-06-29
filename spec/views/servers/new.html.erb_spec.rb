require 'rails_helper'

RSpec.describe "servers/new", type: :view do
  before(:each) do
    assign(:server, build(:server))
  end

  it "renders new server form" do
    render

    assert_select "form[action=?][method=?]", servers_path, "post" do

      assert_select "input#server_name[name=?]", "server[name]"
      assert_select "input#server_public_ip[name=?]", "server[public_ip]"
      assert_select "select#server_application_id[name=?]", "server[application_id]"
    end
  end
end
