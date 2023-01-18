require 'rails_helper'

RSpec.describe CarPattern, type: :model do
  it 'Expects that child is nil for new CarPattern' do
    car_pattern = FactoryBot.create(:car_pattern)
    expect(car_pattern.child).to be nil
  end

  it 'car_pattern CopyConcern methods' do
    car_pattern = FactoryBot.create(:car_pattern)
    # passing empty list of new params to create a full copy
    car_pattern_copy = CarPattern.create_copy({}, car_pattern)

    expect(car_pattern.name).to eq car_pattern_copy.name
  end

  it 'car_pattern actual? method' do
    car_pattern = FactoryBot.create(:car_pattern)

    expect(car_pattern.actual?).to be true
  end

  it 'car_pattern last_ancestor method' do
    car_pattern = FactoryBot.create(:car_pattern)

    expect(car_pattern.last_ancestor).to be nil
  end

  it 'car_pattern get_ancestors method' do
    car_pattern = FactoryBot.create(:car_pattern)

    expect(car_pattern.get_ancestors.size).to be 0
  end
end
