require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is expected to output #email as string' do
    user = build(:user)
    expect(user.to_s).to eq(user.email)
  end
end
