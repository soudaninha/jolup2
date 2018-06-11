class AddProfilecompleteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profilecomplete, :boolean, :default => false
    add_index :users, :profilecomplete
  end
end
