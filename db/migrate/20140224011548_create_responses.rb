class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :proposal_id
      t.integer :question_id
      t.text    :value
      t.timestamps
    end
  end
end
