class Rating < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user

  validates :proposal, presence: true
  validates :user, presence: true
  validates :score, numericality: {
    only_integer: true,
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0
  }

end
