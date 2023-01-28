# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module CopyConcern
  extend ActiveSupport::Concern

  # Instance methods
  included do
    def create_copy(new_params = {})
      object = self.class.new(self.dup.attributes)
      object.assign_attributes(new_params)
      object
    end
  end

  # Class methods
  class_methods do
    # Creates copy of existing object
  end
end
