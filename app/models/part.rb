class Part < ApplicationRecord
  include AncestorsConcern
  include CopyConcern

  has_many :car_pattern_units
end
