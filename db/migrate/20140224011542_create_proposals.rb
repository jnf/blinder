class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :event_id
      t.text    :code
      t.timestamps
    end

    add_index :proposals, :code
  end
end
