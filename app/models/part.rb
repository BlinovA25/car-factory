class Part < ApplicationRecord
  has_many :car_pattern_units

  scope :actual, -> { where(child: nil) }

  # Creates copy of existing Part
  def self.create_copy(new_params, original_object)
    part = Part.new(original_object.dup.attributes)
    part.assign_attributes(new_params)
    part
  end

  # Returns last ancestor of Part
  def last_ancestor
    Part.all.each do |part|
      return part if part.child == id
    end
    return nil
  end

  # Returns list of all ancestors for current part
  def self.get_ancestors(child_part, ancestors_list = [])
    Part.all.each do |part|
      if part.child == child_part.id
        ancestors_list << part
        get_ancestors(part, ancestors_list)
      end
    end
    ancestors_list
  end

end
