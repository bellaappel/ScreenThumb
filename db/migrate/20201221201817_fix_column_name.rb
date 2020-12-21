class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :plants, :plant_type_id, :order_id
  end
end
