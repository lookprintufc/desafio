class AgencyBanksController < BaseController
  before_action :set_agency_bank, only: [:show, :edit, :update, :destroy]

  # GET /agency_banks
  # GET /agency_banks.json
  def index
    @agency_banks = AgencyBank.all
  end

  # GET /agency_banks/1
  # GET /agency_banks/1.json
  def show
  end

  # GET /agency_banks/new
  def new
    @agency_bank = AgencyBank.new
  end

  # GET /agency_banks/1/edit
  def edit
  end

  # POST /agency_banks
  # POST /agency_banks.json
  def create
    @agency_bank = AgencyBank.new(agency_bank_params)

    respond_to do |format|
      if @agency_bank.save
        format.html { redirect_to agency_banks_path, notice: 'Agência foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @agency_bank }
      else
        format.html { render :new }
        format.json { render json: @agency_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agency_banks/1
  # PATCH/PUT /agency_banks/1.json
  def update
    respond_to do |format|
      if @agency_bank.update(agency_bank_params)
        format.html { redirect_to agency_banks_path, notice: 'Agência foi editada com sucesso.' }
        format.json { render :show, status: :ok, location: @agency_bank }
      else
        format.html { render :edit }
        format.json { render json: @agency_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agency_banks/1
  # DELETE /agency_banks/1.json
  def destroy
    @agency_bank.destroy
    respond_to do |format|
      format.html { redirect_to agency_banks_url, notice: 'Agência foi apagadas com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency_bank
      @agency_bank = AgencyBank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_bank_params
      params.require(:agency_bank).permit(:number_agency, :address)
    end
end
