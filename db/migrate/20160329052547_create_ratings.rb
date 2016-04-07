class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score, default: 0
      t.integer :proposal_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
