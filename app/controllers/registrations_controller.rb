class RegistrationsController < SecuredController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  before_action :set_voting, only: [:index, :new, :create]

  # GET /registrations
  # GET /registrations.json
  def index
  end

  # GET /registrations/new
  def new
    @registration = Registration.new(voting: @voting)
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        flash[:success] = 'Registration was successfully created.'
        format.html { redirect_to voting_registrations_path(@registration.voting) }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        flash[:success] = 'Registration was successfully updated.'
        format.html { redirect_to voting_registrations_path(@registration.voting) }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to voting_registrations_path(@registration.voting), notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_voting
    @voting = Voting.find(params[:voting_id])
  end

  # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:voting_id, :participant_id, :order_no)
    end
end

