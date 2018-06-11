class CreateJoinTableProfcatesProfiles < ActiveRecord::Migration[5.0]
  def change
    create_join_table :profcates, :profiles do |t|
      # t.index [:profcate_id, :profile_id]
      # t.index [:profile_id, :profcate_id]
    end
  end
end
