require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
        FactoryGirl.build_stubbed(:server, name: 'falcon'),
        FactoryGirl.build_stubbed(:server, name: 'falcon')
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => "falcon".to_s, :count => 2
  end
end
