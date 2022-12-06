# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module CopyConcern
  extend ActiveSupport::Concern

  # Instance methods
  included do
  end

  # Class methods
  class_methods do
    # Creates copy of existing object
    def create_copy(new_params, original_object)
      object = new(original_object.dup.attributes)
      object.assign_attributes(new_params)
      object
    end
  end
end
