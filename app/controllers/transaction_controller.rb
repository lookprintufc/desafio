class TransactionController < BaseController

  before_action :set_account_bank, only: [:send_deposit, :send_withdrawal, :send_money_transfer]
  before_action :set_account_bank_destination, only: :send_money_transfer

  def index
  end

  def deposit
    @transaction = Transaction.new
  end

  def send_deposit
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
  end

  def withdrawal
    @transaction = Transaction.new
  end

  def send_withdrawal
    @transaction = Transaction.new(account_bank_id: @find_account_bank.id, price: params[:price], transaction_type: :withdrawal, user_id: @user.id)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_path, notice: 'Saque efetuado com sucesso.' }
        format.json { render :deposit, status: :created }
      else
        format.html { render :withdrawal }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def cash_back
    @t = Transaction.find_by_id(params[:transaction_id])
    if !@t.nil? && !@t.cash_out
      if @t.transaction_type == "deposit"
        @t.update_attribute('cash_out', true)
        Transaction.create!(account_bank_id: @t.account_bank_id, price: @t.price, transaction_type: :cash_back_out, user_id: @user.id)
        redirect_to account_bank_path(@t.account_bank_id), alert: "Sucesso"
      elsif @t.transaction_type == "transfer_out"
        @transaction = ActiveRecord::Base.transaction do
          begin
            @t.update_attribute('cash_out', true)
            #adicionar na conta atual
            Transaction.create!(account_bank_id: @t.account_bank_id, price: @t.price, transaction_type: :cash_back_in, user_id: @user.id)
            #remover da outra conta
            Transaction.create!(account_bank_id: @t.destination_account_bank_id, price: @t.price, transaction_type: :cash_back_out, user_id: @user.id)
          rescue  => ex
            # p ex
            @t.update_attribute('cash_out', false)
            raise ActiveRecord::Rollback
          end
        end
        if @transaction
          redirect_back(fallback_location: authenticated_user_root_path, alert: "Sucesso")
        else
          redirect_back(fallback_location: authenticated_user_root_path, alert: "Erro. Verifique o limite das contas envolvidas")
        end
      end
    else
      redirect_to account_bank_path(@t.account_bank_id), alert: "Erro! O estorno já foi realizado"
    end
  end

  def money_transfer
    @transaction = Transaction.new
  end

  def send_money_transfer
    #INSERIR
    @transaction_to = Transaction.new(account_bank_id: @find_account_bank_d.id, price: params[:price], transaction_type: :transfer_in, user_id: @user.id, destination_account_bank_id: @find_account_bank.id )
    #RETIRAR
    @transaction_from = Transaction.new(account_bank_id: @find_account_bank.id, price: params[:price], transaction_type: :transfer_out, user_id: @user.id, destination_account_bank_id: @find_account_bank_d.id )

    @transaction = ActiveRecord::Base.transaction do
      begin
        @transaction_to.save!
        @transaction_from.save!
        @transaction = true
      rescue  => ex
        @transaction = false
        raise ActiveRecord::Rollback
      end
    end

    if @transaction
      redirect_to money_transfer_path, notice: 'Transferência efetuada com sucesso.'
    else
      redirect_to money_transfer_path, notice: 'Houve um erro ao realizar a transferência. Verifique o saldo e o limite das respectivas contas'
    end
  end

  def suggestion

    @account = AccountBank.find_by_number_account(params[:number_account])
    unless  @account.nil?
      render html: ("Ag: #{@account.agency_bank.number_agency}, Saldo: #{view_context.number_to_currency(@account.saldo)}, Limite: #{view_context.number_to_currency(@account.limit)}").html_safe
    else
      render html: ("Conta não encontrada.").html_safe
    end
  end


  private

  def set_account_bank
    @find_account_bank = AccountBank.find_by_number_account(params[:number_account])
    if @find_account_bank.nil?
      #CONTA NAO ENCONTRADA
      redirect_back(fallback_location: authenticated_user_root_path, alert: "Não foi possível encontrar a conta bancária (De).")
    end
  end


  def set_account_bank_destination
    @find_account_bank_d = AccountBank.find_by_number_account(params[:number_account_destination])
    if @find_account_bank_d.nil?
      #CONTA NAO ENCONTRADA
      redirect_back(fallback_location: authenticated_user_root_path, alert: "Não foi possível encontrar a conta bancária (Para).")
    end
  end


end
