class CarPattern < ApplicationRecord
  has_many :car_pattern_units
  # has_many :cars

  include AncestorsConcern
  include IdsConcern

  amoeba do
    enable
  end

  # Creates copy of object with new ID and timestamps and updates original object child value
  def copy
    new_car_pattern = amoeba_dup
    new_car_pattern.save
    update(child: new_car_pattern.id)
    car_pattern_units.each do |car_pattern_unit|
      new_car_pattern.car_pattern_units.each do |new_car_pattern_unit|
        car_pattern_unit.update(child: new_car_pattern_unit.id) if new_car_pattern_unit.part_id == car_pattern_unit.part_id
      end
    end
    new_car_pattern
  end
end
