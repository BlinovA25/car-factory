# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module AncestorsConcern
  extend ActiveSupport::Concern

  # Instance methods
  included do
    # Returns only latest versions of each instance
    scope :actual, -> { where(child: nil) }

    # Returns last ancestor for current instance
    def last_ancestor
      self.class.all.each do |part|
        return part if part.child == id
      end
      return nil
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
