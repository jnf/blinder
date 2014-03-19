class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :proposal_id
      t.text    :content
      t.timestamps
    end
  end
end
