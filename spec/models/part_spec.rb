require 'rails_helper'

RSpec.describe Part, type: :model do
  it 'Expects that child is nil for new CarPattern' do
    part = FactoryBot.create(:part)
    expect(part.child).to be nil
  end
end
