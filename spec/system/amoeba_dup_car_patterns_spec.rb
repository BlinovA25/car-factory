require 'rails_helper'

RSpec.describe "AmoebaDupCarPatterns", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "amoeba_dup_car_pattern works fine" do
    car_pattern = FactoryBot.create(:car_pattern, name: "old_car_pattern")
    part = FactoryBot.create(:part)
    car_pattern_unit = FactoryBot.create(:car_pattern_unit, car_pattern_id: car_pattern.id, part_id: part.id)

    new_part = FactoryBot.create(:part, title: "new_part", price: 1200)

    p new_part

    # CarPattern.amoeba_dup_car_pattern(new_part)

    # expect { FactoryBot.create(:new) }.to change { New.all.count }.by(1)
    expect { CarPattern.amoeba_dup_car_pattern(part) }.to change { CarPattern.all.count }.by(1)
  end
end
