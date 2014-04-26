class Question < ActiveRecord::Base
  belongs_to    :blind
  acts_as_list  scope: :blind
  has_many      :responses

  validates_presence_of :group, :if => Proc.new{ |question| question.kind == "radio" }

  scope :sortable, -> { where(sortable: true) }

end
