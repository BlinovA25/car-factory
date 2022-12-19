class CarPatternUnit < ApplicationRecord
  belongs_to :car_pattern
  belongs_to :part

  include AncestorsConcern

  # Checks if CarPatternUnit is unique
  def unique?
    CarPatternUnit.find_by(car_pattern_id: car_pattern_id, part_id: part_id).nil?
  end
end
