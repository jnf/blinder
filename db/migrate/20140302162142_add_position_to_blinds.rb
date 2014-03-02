class AddPositionToBlinds < ActiveRecord::Migration
  def change
    add_column :blinds, :position, :integer
  end
end
