class Participant < ApplicationRecord
  has_many :registrations, :dependent => :restrict_with_error
  has_many :votings, through: :registrations
  has_many :votes, through: :registrations

  validates :country, presence: true
  validates :artist, presence: true
  validates :title, presence: true

  def to_string
    country + " | " + artist + " | " + title
  end
end
