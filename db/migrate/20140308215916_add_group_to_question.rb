class AddGroupToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :group, :text
  end
end
