class Registration < ApplicationRecord
  belongs_to :voting
  belongs_to :participant
  has_many :votes, dependent: :destroy
  attr_accessor :votecount

  validates :order_no, numericality: { only_integer: true }

  validates :voting, presence: true
  validates :participant, presence: true
  validates_uniqueness_of :participant, :scope => :voting
  validates_uniqueness_of :order_no, :scope => :voting

  scope :latest_votes, -> {Vote.latest_votes(@voting.votes)}

end