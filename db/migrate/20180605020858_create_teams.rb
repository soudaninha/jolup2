class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :title
      t.date :deadline
      t.integer :memnum
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
