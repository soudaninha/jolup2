class CreateWorkcates < ActiveRecord::Migration[5.0]
  def change
    create_table :workcates do |t|
      t.string :name

      t.timestamps
    end
  end
end
