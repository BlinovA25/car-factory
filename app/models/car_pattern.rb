class CarPattern < ApplicationRecord
  has_many :car_pattern_units
  has_many :cars

  amoeba do
    enable
  end

  # updates
  def amoeba_dup_car_pattern(new_part)
    new_part.last_ancestor.car_pattern_units.each do |car_pattern_unit|
      car_pattern = CarPattern.find(id: car_pattern_unit.car_pattern_id)
      car_pattern.amoeba_dup
      car_pattern.car_pattern_units.each do |car_pattern_unit|
        car_pattern_unit.update(part_id: new_part.id) if car_pattern_unit.part_id == new_part.last_ancestor.id
      end
    end
  end




end
