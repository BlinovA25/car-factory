module OrderConcern
  extend ActiveSupport::Concern

  included do
    def set_order(union_by = nil)
      unless union_by.nil?
        @objects = self.class.where(union_by: self.car)
      else
        @objects = self.class.all
      end

    end
  end

  # TODO:  car_pattern_unit.set_order(car_pattern_id)

  # Class methods
  class_methods do

  end
end
