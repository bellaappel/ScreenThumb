class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :reciepient_id
      t.timestamp :created_at
      t.text :content
      t.boolean :read
    end
  end
end
  