class Part < ApplicationRecord
  include AncestorsConcern

  has_many :car_pattern_units

  # Creates copy of existing Part
  def self.create_copy(new_params, original_object)
    part = Part.new(original_object.dup.attributes)
    part.assign_attributes(new_params)
    part
  end
end
