# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module CopyConcern
  extend ActiveSupport::Concern

  # Instance methods
  included do
    def actual?
      child.nil?
    end

    def copy(new_params = {})
      ActiveRecord::Base.transaction do
        object = self.class.new(dup.attributes)
        object.assign_attributes(new_params)
        object.save!
        self.update!(child: object.id)
        object
      end
    end
  end

  # Class methods
  class_methods do
  end
end
