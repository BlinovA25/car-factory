class CarPatternUnit < ApplicationRecord
  belongs_to :car_pattern
  belongs_to :part

  def self.update_car_pattern_unit(new_part); end
end
