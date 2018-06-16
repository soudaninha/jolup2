class CreateTeamrefs < ActiveRecord::Migration[5.0]
  def change
    create_table :teamrefs do |t|
      # 팀 게시판에 서로 소통하기 위해 글을 남기는 용도
      t.text :content
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
