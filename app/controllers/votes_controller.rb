class VotesController < ApplicationController
  # When receiving vote respond only with view content
  layout false, only: [:receive_vote]

  protect_from_forgery except: [:receive_vote]
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # POST /vote_for/1
  # Controller that responds to Twilio
  def receive_vote
    puts "!!!!!!!!!!!!!!!!!"
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
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:registration_id, :from_phone, :to_phone, :from_country)
    end

    def call_params
      {
          from_phone:   params['From'],
          to_phone:     params['To'],
          from_country: params['FromCountry']
      }
    end

end
