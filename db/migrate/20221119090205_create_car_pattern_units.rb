class CreateCarPatternUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :car_pattern_units do |t|
      t.references :car_pattern, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
