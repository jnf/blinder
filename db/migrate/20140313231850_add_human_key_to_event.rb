class AddHumanKeyToEvent < ActiveRecord::Migration
  def change
    add_column :events, :human_key, :string, default: "I am a human."
  end
end
