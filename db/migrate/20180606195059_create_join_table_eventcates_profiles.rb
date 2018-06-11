class CreateJoinTableEventcatesProfiles < ActiveRecord::Migration[5.0]
  def change
    create_join_table :eventcates, :profiles do |t|
      # t.index [:eventcate_id, :profile_id]
      # t.index [:profile_id, :eventcate_id]
    end
  end
end
