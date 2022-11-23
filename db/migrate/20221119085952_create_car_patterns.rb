class CreateCarPatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :car_patterns do |t|
      t.string :name
      t.string :description
      t.integer :child

      t.timestamps
    end
  end
end
