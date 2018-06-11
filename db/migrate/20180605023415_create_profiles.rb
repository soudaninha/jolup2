class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.date :birthdate
      t.string :phone
      t.boolean :sex
      t.string :name
      t.integer :eventnum
      t.text :introduce
      t.string :webpage
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
