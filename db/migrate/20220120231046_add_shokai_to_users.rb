class AddShokaiToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :shokai, :text
  end
end
