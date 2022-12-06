class AddChildToCarPatternUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :car_pattern_units, :child, :integer
  end
end
