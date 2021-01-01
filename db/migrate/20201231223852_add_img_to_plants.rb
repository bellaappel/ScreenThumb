class AddImgToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :img, :string
  end
end
