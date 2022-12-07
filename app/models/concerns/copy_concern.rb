# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module CopyConcern
  extend ActiveSupport::Concern

  # Instance methods
  included do

    # Creates copy of existing object
    def create_copy(new_params)
      if self.actual?
        object = self.class.new(self.dup.attributes)
        object.assign_attributes(new_params)
        object
      else
        raise "Object is not actual"
      end
    end

  end

  # Class methods
  class_methods do
  end
end
