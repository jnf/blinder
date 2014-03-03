class ChangeCodeToSlug < ActiveRecord::Migration
  def self.up
    rename_column :proposals, :code, :slug
  end

  def self.down
    rename_column :proposals, :slug, :code
  end
end
