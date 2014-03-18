class AddSafeForReviewToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :safe_for_review, :boolean, default: false
  end
end
