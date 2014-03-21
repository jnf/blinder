class AddExpirationDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :expires_at, :datetime
  end
end
