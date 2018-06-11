class CreateJoinTableInterestcatesProfiles < ActiveRecord::Migration[5.0]
  def change
    create_join_table :interestcates, :profiles do |t|
      # t.index [:interestcate_id, :profile_id]
      # t.index [:profile_id, :interestcate_id]
    end
  end
end
