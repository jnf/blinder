require 'digest/sha1'

class Proposal < ActiveRecord::Base
  has_many   :responses, autosave: true
  belongs_to :event

  after_create :generate_slug

  scope :listing,   -> { select(:id, :slug, :created_at) }
  scope :for_event, -> (event_id) { listing.where(event_id: event_id).order(:created_at) }

  validates_associated :responses
  accepts_nested_attributes_for :responses

  protected

  def generate_slug
    self.slug = Digest::SHA1.hexdigest(Time.now.to_s + self.responses.sample.value)
    save!
  end
end
