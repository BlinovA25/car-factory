class CarPatternUnit < ApplicationRecord
  include AncestorsConcern
  include CopyConcern

  belongs_to :car_pattern
  belongs_to :part
end
