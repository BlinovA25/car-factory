class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def actual?
    child.nil?
  end
end
