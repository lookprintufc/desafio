class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account_bank, -> { with_deleted }
  belongs_to :destination_account_bank, -> { with_deleted }, class_name: "AccountBank", optional: true


  #DEPOSITO, SAQUE, ESTORNO, E TRANSFERENCIA ENTRE CONTAS
  #cash_back_in = dinheiro entrou na conta
  #cash_back_out = dinheiro saiu da conta
  enum transaction_type: [:deposit, :withdrawal, :cash_back_in, :cash_back_out, :transfer_in, :transfer_out]

  validate :check_limit_max_account
  validate :check_limit_min_account
  validate :account_transaction_uniqueness

  def account_transaction_uniqueness
    errors.add(:destination_account_bank_id, 'não pode ser igual a conta de origem (De)') if account_bank_id == destination_account_bank_id
  end

  #O limite MÁXIMO só será checado no deposito, estorno e transf entre contas
  def types_check_max
    ["deposit", "transfer_in", "cash_back_in"]
  end

  #retiradas
  def types_check_min
    # ["withdrawal", "transfer_out", "cash_back_out"]
    ["withdrawal", "transfer_out"]
  end

  private

  def has_limit_max?
    if self.types_check_max.include? self.transaction_type
      #OBTER SALDO DA CONTA E COMPARAR COM O LIMITE
      return false if (self.price + self.account_bank.saldo > self.account_bank.limit)
    end
    true
  end

  def check_limit_max_account
    errors.add("Valor","ultrapassou o limite da conta") unless has_limit_max?
  end


  def has_limit_min?
    if self.types_check_min.include? self.transaction_type
      #OBTER SALDO DA CONTA E COMPARAR COM O LIMITE
      return false if (self.account_bank.saldo - self.price < 0)
    end
    true
  end

  def check_limit_min_account
    errors.add("Saldo","insuficiente") unless has_limit_min?
  end


end
