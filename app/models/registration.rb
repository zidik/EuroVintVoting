class Registration < ApplicationRecord
  belongs_to :voting
  belongs_to :participant
  has_many :votes

  validates :order_no, numericality: { only_integer: true }

  validates :voting, presence: true
  validates :participant, presence: true
  validates_uniqueness_of :participant, :scope => :voting
  validates_uniqueness_of :order_no, :scope => :voting

end