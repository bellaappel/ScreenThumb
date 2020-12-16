class CreatePlantTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
