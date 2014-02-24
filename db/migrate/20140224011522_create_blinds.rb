class CreateBlinds < ActiveRecord::Migration
  def change
    create_table :blinds do |t|
      t.integer :level
      t.integer :event_id
      t.string  :title
      t.text    :info
      t.timestamps
    end
  end
end
