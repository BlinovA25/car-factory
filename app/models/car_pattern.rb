class CarPattern < ApplicationRecord
  has_many :car_pattern_units
  has_many :cars

  include AncestorsConcern

  amoeba do
    enable
  end

  # Creates copy of object with new ID and timestamps and updates original object child value
  def copy
    new_car_pattern = amoeba_dup
    new_car_pattern.save
    update(child: new_car_pattern.id)
    new_car_pattern
  end

  # TODO: create general realization
  def self.next_id
    ActiveRecord::Base.connection.execute("select last_value from car_patterns_id_seq").first["last_value"].to_i
  end

  # updates car patterns including new_part
  def self.amoeba_dup_car_pattern(new_part)
    # for each ancestor find CarPattern and dup it
    new_part.last_ancestor.car_pattern_units.each do |car_pattern_unit|
      car_pattern = CarPattern.find(car_pattern_unit.car_pattern_id)
      new_car_pattern = car_pattern.amoeba_dup
      new_car_pattern.save
      car_pattern.update(child: new_car_pattern.id)
      # update part_id for car_pattern_unit that stores previous part_id in comparing with new_part
      new_car_pattern.car_pattern_units.each do |car_pattern_unit|
        car_pattern_unit.update(part_id: new_part.id) if car_pattern_unit.part_id == new_part.last_ancestor.id
      end
    end
  end

end
