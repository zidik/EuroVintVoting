class VotesController < SecuredController
  # When receiving vote respond only with view content
  layout false, only: [:receive_vote]

  protect_from_forgery except: [:receive_vote]

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

  private
    def call_params
      {
          from_phone:   params['From'],
          to_phone:     params['To'],
          from_country: params['FromCountry']
      }
    end

end
