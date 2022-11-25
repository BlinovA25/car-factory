class Part < ApplicationRecord
  has_many :car_pattern_units

  scope :actual, -> { where(child: nil) }

  def gen_id_and_timestamps
    new_id = Part.ids.max + 1
    assign_attributes({ id: new_id, created_at: DateTime.now, updated_at: DateTime.now })
  end

  # Creates copy of existing Part
  def self.create_copy(new_params, original_object)
    part = original_object.dup
    part.assign_attributes(new_params)
    part.gen_id_and_timestamps
    part
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
