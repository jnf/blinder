class Proposal < ActiveRecord::Base
  has_many   :responses
  belongs_to :event

  after_create :generate_code

  accepts_nested_attributes_for :responses

  protected

  def generate_code
    self.code = "lolcodelol"
    save!
  end
end
