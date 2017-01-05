class RestrictedNumbersController < SecuredController
  before_action :set_restricted_number, only: [:show, :edit, :update, :destroy]
  skip_before_action :logged_in_using_omniauth?, :only => [:index, :show] unless Rails.env.test?

  # GET /restricted_numbers
  # GET /restricted_numbers.json
  def index
    @restricted_numbers = RestrictedNumber.all
  end

  # GET /restricted_numbers/1
  # GET /restricted_numbers/1.json
  def show
  end

  # GET /restricted_numbers/new
  def new
    @restricted_number = RestrictedNumber.new
  end

  # GET /restricted_numbers/1/edit
  def edit
  end

  # POST /restricted_numbers
  # POST /restricted_numbers.json
  def create
    @restricted_number = RestrictedNumber.new(restricted_number_params)

    respond_to do |format|
      if @restricted_number.save
        flash[:success] = 'Piiratud number lisatud'
        format.html { redirect_to restricted_numbers_path }
        format.json { render :show, status: :created, location: @restricted_number }
      else
        format.html { render :new }
        format.json { render json: @restricted_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restricted_numbers/1
  # PATCH/PUT /restricted_numbers/1.json
  def update
    respond_to do |format|
      if @restricted_number.update(restricted_number_params)
        flash[:success] = 'Piiratud number uuendatud'
        format.html { redirect_to restricted_numbers_path}
        format.json { render :show, status: :ok, location: @restricted_number }
      else
        format.html { render :edit }
        format.json { render json: @restricted_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restricted_numbers/1
  # DELETE /restricted_numbers/1.json
  def destroy
    @restricted_number.destroy
    respond_to do |format|
      flash[:success] = 'Piiratud number eemaldatud!'
      format.html { redirect_to restricted_numbers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restricted_number
      @restricted_number = RestrictedNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restricted_number_params
      params.require(:restricted_number).permit(:name, :number)
    end
end
