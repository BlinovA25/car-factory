# frozen_string_literal: true

# Ancestors module allows you to use all ancestors methods
module Ancestors
  extend ActiveSupport::Concern

  # Instance methods
  included do
    # Returns last ancestor for current instance
    def last_ancestor
      self.class.name.all.each do |part|
        return part if part.child == id
      end
      return nil
    end

    # Returns list of all ancestors for current instance
    def get_ancestors(ancestors_list = [])
      self.class.name.all.each do |part|
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
