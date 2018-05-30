class CreateEventcates < ActiveRecord::Migration
  def change
    create_table :eventcates do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
