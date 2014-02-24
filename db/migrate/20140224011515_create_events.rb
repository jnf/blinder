class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :title
      t.integer :blind_level
      t.text    :info
      t.timestamps
    end
  end
end
