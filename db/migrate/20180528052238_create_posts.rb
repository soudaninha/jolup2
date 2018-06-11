class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.date :eventdate
      t.date :recruitdate
      t.string :weblink
      t.string :s3_file
      t.references :user, index: true, foreign_key: true
      t.references :eventcate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
