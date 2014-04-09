class Scrub < ActiveRecord::Base
  belongs_to :response

  def save_message
    valid? ? "Saved!" : "Something went wrong. :("
  end
end
