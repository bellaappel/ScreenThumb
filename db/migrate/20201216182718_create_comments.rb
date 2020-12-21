class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :plant_id
      t.string :user_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
