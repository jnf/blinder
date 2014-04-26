class AddSortableToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :sortable, :boolean, default: false
  end
end
