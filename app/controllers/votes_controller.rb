class VotesController < SecuredController
  # When receiving vote respond only with view content (Twilio specific)
  layout false, only: [:receive_vote]
  # Do not ask anti-forgery token from Twilio
  protect_from_forgery except: [:receive_vote, :receive_sms]
  # Do not force Twilio to authenticate with omniauth
  skip_before_action :logged_in_using_omniauth?, :only => [:receive_vote, :receive_sms] unless Rails.env.test?

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # POST /vote_for/1
  # Controller that responds to Twilio
  def receive_vote
    current = Voting.current
    raise "There is no voting that is 'current'" if current.nil?

    unless current.running?
      @response = "Voting is stopped"
      return
    end

    registration = current.registrations.find_by order_no: params["choice"]
    raise "No registration found!" if registration.nil?

    # Let's try to save the vote to DB
    vote = Vote.new(call_params)
    vote.active = true
    vote.registration = registration
    vote.save!

    # All went well - let's notify user!
    @response = "Thank you! Vote received!"

  rescue StandardError => e
    logger.error e.message
    #logger.error e.backtrace.join("\n")
    @response = "Something went wrong. Try again later."
    raise
  end

  def receive_sms
    current = Voting.current
    raise "There is no voting that is 'current'" if current.nil?
    return head(:forbidden) unless current.running?

    registration = current.registrations.find_by order_no: params["Body"].to_i
    raise "No registration found!" if registration.nil?

    # Let's try to save the vote to DB
    vote = Vote.new(call_params)
    vote.active = true
    vote.registration = registration
    vote.save!
    current.votes
        .where(from_phone: vote.from_phone)
        .where.not(id: vote.id)
        .update(active: false)
  end

  private
    def call_params
      {
          from_phone:   params['From'],
          to_phone:     params['To'],
          from_country: params['FromCountry']
      }
    end

end
