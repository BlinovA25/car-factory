class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :serial_number
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
