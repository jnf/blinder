class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :blind_id
      t.string  :label
      t.string  :type
      t.text    :values
      t.timestamps
    end
  end
end
