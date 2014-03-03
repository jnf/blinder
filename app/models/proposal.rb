require 'digest/sha1'

class Proposal < ActiveRecord::Base
  has_many   :responses, autosave: true
  belongs_to :event

  after_create :generate_slug

  accepts_nested_attributes_for :responses

  protected

  def generate_slug
    self.slug = Digest::SHA1.hexdigest(Time.now.to_s + self.responses.sample.value)
    save!
  end
end
