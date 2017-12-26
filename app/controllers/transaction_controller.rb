class TransactionController < BaseController
  def index
  end

  def deposit
    @transaction = Transaction.new
  end

  def send_deposit
    @find_account_bank = AccountBank.find_by_number_account(params[:number_account])

    unless @find_account_bank.nil?
      @transaction = Transaction.new(account_bank_id: @find_account_bank.id, price: params[:price], transaction_type: :deposit, user_id: @user.id)

      respond_to do |format|
        if @transaction.save
          format.html { redirect_to transaction_path, notice: 'Depósito efetuado com sucesso.' }
          format.json { render :deposit, status: :created }
        else
          format.html { render :deposit }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end

    else
      #CONTA NAO ENCONTRADA
      redirect_to deposit_path, alert: "Não foi possível encontrar a conta bancária."
    end

  end

  private


end
