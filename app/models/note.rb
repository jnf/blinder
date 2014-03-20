class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  def save_message
    valid? ? "Saved!" : "Something went wrong. :("
  end
end
