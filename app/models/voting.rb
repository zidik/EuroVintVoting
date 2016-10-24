class Voting < ApplicationRecord
  has_many :registrations, :dependent => :restrict_with_error
  has_many :participants, through: :registrations
  has_many :votes, through: :registrations

  def calls
    Call.where( "created_at >= ? AND created_at <= ?", start_time,stop_time)
  end

  def start!
    return false unless startable?

    self.start_time = DateTime.now
    save
  end

  def stop!
    return false unless stoppable?

    self.stop_time = DateTime.now
    save
  end

  def reset!
    return false unless resettable?

    self.start_time = nil
    self.stop_time = nil
    save
  end

  def continue!
    return false unless continuable?

    self.stop_time = nil
    save
  end

  def started?
    not start_time.nil?
  end

  def startable?
    start_time.nil? and stop_time.nil?
  end

  def stoppable?
    started? and stop_time.nil?
  end

  def resettable?
    true
  end

  def continuable?
    started? and stopped?
  end

end
