class CreateNewNotifications < ActiveRecord::Migration
  def change
    create_table :new_notifications do |t|
      t.string :content
      t.string :link
      t.belongs_to :user
      #t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
