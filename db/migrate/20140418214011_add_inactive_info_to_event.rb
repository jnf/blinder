class AddInactiveInfoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :inactive_info, :text, default: ''
  end
end
