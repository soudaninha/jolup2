class CreateJoinTableInterestcatesPosts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :interestcates, :posts do |t|
      # t.index [:interestcate_id, :post_id]
      # t.index [:post_id, :interestcate_id]
    end
  end
end
