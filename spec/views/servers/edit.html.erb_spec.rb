require 'rails_helper'

RSpec.describe "servers/edit", type: :view do
  before(:each) do
    @server = assign(:server,   create(:server))
  end

  it "renders the edit server form" do
    render

    assert_select "form[action=?][method=?]", server_path(@server), "post" do

      assert_select "input#server_name[name=?]", "server[name]"
      assert_select "input#server_public_ip[name=?]", "server[public_ip]"
      assert_select "select#server_application_id[name=?]", "server[application_id]"
    end
  end
end
