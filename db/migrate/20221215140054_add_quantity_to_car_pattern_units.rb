class AddQuantityToCarPatternUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :car_pattern_units, :quantity, :integer, null: false, default: 1
  end
end
