class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.boolean :toxicity
      t.string :sunlight
      t.integer :user_id
      t.integer :plant_type_id

      t.timestamps
    end
  end
end
