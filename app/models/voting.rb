class Voting < ApplicationRecord
  has_many :registrations, :dependent => :restrict_with_error
  has_many :participants, through: :registrations
  has_many :votes, through: :registrations

  validates :name, presence: true

  def self.current
    Voting.last
  end

  def current?
    Voting.current == self
  end


  def start!
    return false unless startable?
    self.running = true
    save
  end

  def stop!
    return false unless stoppable?
    self.running = false
    save
  end

  def startable?
    not self.running and self.current?
  end

  def stoppable?
    self.running
  end

end
