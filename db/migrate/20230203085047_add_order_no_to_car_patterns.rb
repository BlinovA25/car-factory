class AddOrderNoToCarPatterns < ActiveRecord::Migration[6.0]
  def change
    add_column :car_patterns, :order_no, :integer
  end
end
