class VotingsController < ApplicationController
  before_action :set_voting, only: [:show, :edit, :update, :destroy, :start, :stop]

  # GET /votings
  # GET /votings.json
  def index
    @votings = Voting.all
  end

  # GET /votings/1
  # GET /votings/1.json
  def show
  end

  # GET /votings/new
  def new
    @voting = Voting.new
  end

  # GET /votings/1/edit
  def edit
  end

  # POST /votings
  # POST /votings.json
  def create
    @voting = Voting.new(voting_params)

    respond_to do |format|
      if @voting.save
        format.html { redirect_to @voting, notice: 'Voting was successfully created.' }
        format.json { render :show, status: :created, location: @voting }
      else
        format.html { render :new }
        format.json { render json: @voting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votings/1
  # PATCH/PUT /votings/1.json
  def update
    respond_to do |format|
      if @voting.update(voting_params)
        format.html { redirect_to @voting, notice: 'Voting was successfully updated.' }
        format.json { render :show, status: :ok, location: @voting }
      else
        format.html { render :edit }
        format.json { render json: @voting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votings/1
  # DELETE /votings/1.json
  def destroy
    if @voting.destroy
      respond_to do |format|
        format.html {
          flash[:success] = 'Voting was successfully deleted.'
          redirect_back fallback_location: votings_url
        }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = 'Could not delete voting.'
          redirect_back fallback_location: votings_url
        }
        format.json { head :no_content }
      end
    end

  end

  # POST /votings/1/start
  def start
    if @voting.start!
      flash[:success] = "Voting started"
    else
      flash[:error] = "Failed to start voting!"
    end
    redirect_back(fallback_location: @voting)
  end

  # POST /votings/1/stop
  def stop
    if @voting.stop!
      flash[:success] = "Voting stopped"
    else
      flash[:error] = "Failed to stop voting!"
    end
    redirect_back(fallback_location: @voting)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting
      @voting = Voting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_params
      params.require(:voting).permit(:name)
    end
end