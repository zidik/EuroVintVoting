class Registration < ApplicationRecord
  belongs_to :voting
  belongs_to :participant
  has_many :votes
end