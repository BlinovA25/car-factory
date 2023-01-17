require 'rails_helper'

RSpec.describe CarPattern, type: :model do
  it 'first test' do
    expect(false).to be(false)
  end

  it 'Expects that child is nil for new CarPattern' do
    car_pattern = FactoryBot.create(:car_pattern)
    expect(car_pattern.child).to be nil
  end

  it 'car_pattern concern logic works clear' do
    car_pattern = FactoryBot.create(:car_pattern)

    expect(car_pattern.name).to be car_pattern_copy.name
  end
end
