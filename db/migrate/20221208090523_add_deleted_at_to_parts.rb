class AddDeletedAtToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :deleted_at, :datetime
  end
end
