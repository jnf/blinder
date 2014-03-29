class CreateScrubs < ActiveRecord::Migration
  def change
    create_table :scrubs do |t|
      t.integer :response_id
      t.integer :blind_level
      t.text    :value
      t.timestamps
    end
  end
end
