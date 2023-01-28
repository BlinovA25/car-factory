require 'rails_helper'

RSpec.describe CarPattern, type: :model do
  car_pattern = FactoryBot.create(:car_pattern)

  it 'Expects that child is nil for new CarPattern' do
    expect(car_pattern.child).to be nil
  end

  it 'car_pattern CopyConcern methods' do
    # passing empty list of new params to create a full copy
    car_pattern_copy = car_pattern.create_copy

    expect(car_pattern.name).to eq car_pattern_copy.name
  end

  it 'car_pattern actual? method' do
    expect(car_pattern.actual?).to be true
  end

  it 'car_pattern last_ancestor method' do
    expect(car_pattern.last_ancestor).to be_an_instance_of CarPattern
  end

  it 'car_pattern get_ancestors method' do
    expect(car_pattern.get_ancestors.size).to be 0
  end
end
