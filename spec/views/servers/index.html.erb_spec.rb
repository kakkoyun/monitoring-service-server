require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
        build_stubbed(:server, name: 'falcon'),
        build_stubbed(:server, name: 'falcon')
    ])
    assign(:servers_with_most_cpu_usage, [
        build_stubbed(:server, name: 'millenium'),
        build_stubbed(:server, name: 'millenium')
    ])
    assign(:servers_with_low_disk_space, [
        build_stubbed(:server, name: 'empire'),
        build_stubbed(:server, name: 'empire')
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => "falcon".to_s, :count => 2
    assert_select "ul>li", :text => "millenium".to_s, :count => 2
    assert_select "ul>li", :text => "empire".to_s, :count => 2
  end
end
