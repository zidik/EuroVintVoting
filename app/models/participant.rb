class Participant < ApplicationRecord
  has_many :registrations, :dependent => :restrict_with_error
  has_many :votings, through: :registrations
  has_many :votes, through: :registrations

  def to_string
    country + " | " + artist + " | " + title
  end
end
