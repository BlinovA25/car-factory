# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module AncestorsConcern
  extend ActiveSupport::Concern

  # Instance methods
  included do
    # Returns only latest versions of each instance
    scope :actual, -> { where(child: nil) }

    # checks if object is actual(it has the latest version)
    def actual?
      child.nil?
    end

    # Returns last ancestor for current instance
    def last_ancestor
      self.class.find_by(child:id)
    end

    # Returns list of all ancestors for current instance
    def get_ancestors(ancestors_list = [])
      self.class.all.each do |part|
        if part.child == id
          ancestors_list << part
          part.get_ancestors(ancestors_list)
        end
      end
      ancestors_list
    end
  end

  # Class methods
  class_methods do

  end
end
