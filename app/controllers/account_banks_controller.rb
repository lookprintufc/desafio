class AccountBanksController < BaseController
  before_action :set_account_bank, only: [:show, :edit, :update, :destroy]

  # GET /account_banks
  # GET /account_banks.json
  def index
    @account_banks = params[:agency_id].nil? ? AccountBank.all : AccountBank.includes(:agency_bank).where(agency_banks: {id: params[:agency_id]})
  end

  # GET /account_banks/1
  # GET /account_banks/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: TransactionDatatable.new(view_context, {query: @account_bank.transactions}) }
    end
  end

  # GET /account_banks/new
  def new
    @account_bank = AccountBank.new
  end

  # GET /account_banks/1/edit
  def edit
  end

  # POST /account_banks
  # POST /account_banks.json
  def create
    @account_bank = AccountBank.new(account_bank_params)

    respond_to do |format|
      if @account_bank.save
        format.html { redirect_to account_banks_path, notice: 'Conta foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @account_bank }
      else
        format.html { render :new }
        format.json { render json: @account_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_banks/1
  # PATCH/PUT /account_banks/1.json
  def update
    respond_to do |format|
      if @account_bank.update(account_bank_params)
        format.html { redirect_to account_banks_path, notice: 'Conta foi editada com sucesso.' }
        format.json { render :show, status: :ok, location: @account_bank }
      else
        format.html { render :edit }
        format.json { render json: @account_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_banks/1
  # DELETE /account_banks/1.json
  def destroy
    @account_bank.destroy
    respond_to do |format|
      format.html { redirect_to account_banks_url, notice: 'Conta foi deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account_bank
    @account_bank = AccountBank.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_bank_params
    params.require(:account_bank).permit(:agency_bank_id, :number_account, :limit)
  end
end
