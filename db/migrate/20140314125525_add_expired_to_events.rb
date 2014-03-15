class AddExpiredToEvents < ActiveRecord::Migration
  def change
    add_column :events, :expired, :boolean, default: false
  end
end
