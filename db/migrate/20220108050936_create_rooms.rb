class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.text :introduction
      t.integer :price
      t.string :address
      t.string :roomimg
      t.string :user_id

      t.timestamps
    end
  end
end
