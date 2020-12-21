class AddWaterToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :water, :text
    add_column :plants, :propogation, :text
  end
end
