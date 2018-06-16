class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      # 팀에 속한 유저
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.text :username
      t.text :workname

      t.timestamps
    end
  end
end
