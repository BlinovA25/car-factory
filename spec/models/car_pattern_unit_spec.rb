require 'rails_helper'

RSpec.describe CarPatternUnit, type: :model do
  it 'Expects that child is nil for new CarPattern' do
    car_pattern = FactoryBot.create(:car_pattern)
    part = FactoryBot.create(:part)

    car_pattern_unit = FactoryBot.create(:car_pattern_unit, car_pattern_id: car_pattern.id, part_id: part.id)
    expect(car_pattern_unit).to be_an_instance_of CarPatternUnit
  end
end
