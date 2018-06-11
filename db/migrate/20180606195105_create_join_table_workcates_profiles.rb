class CreateJoinTableWorkcatesProfiles < ActiveRecord::Migration[5.0]
  def change
    create_join_table :workcates, :profiles do |t|
      # t.index [:workcate_id, :profile_id]
      # t.index [:profile_id, :workcate_id]
    end
  end
end
