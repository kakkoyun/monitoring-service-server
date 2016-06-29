require 'rails_helper'

RSpec.describe "servers/show", type: :view do
  before(:each) do
    @server = assign(:server, create(:server))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Public IP/)
    expect(rendered).to match(/Application/)
  end
end
