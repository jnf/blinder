class AddExpirationDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :expiration_date, :datetime
  end
end
