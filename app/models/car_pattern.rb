class CarPattern < ApplicationRecord
  has_many :car_pattern_units
  has_many :cars
end
