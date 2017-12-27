class AccountBank < ApplicationRecord
  belongs_to :agency_bank, -> { with_deleted }

  validates :number_account, presence: true, uniqueness: true,
    format: { with: /\A\d+\z/, message: "deve ser somente números." }

  validates :limit, presence: true, uniqueness: true, numericality: {only_float: true}
  has_many :transactions
  acts_as_paranoid

  def saldo
    self.transactions.where(transaction_type: :transfer_in).sum(:price) +
  	self.transactions.where(transaction_type: :cash_back_in).sum(:price) +
  	self.transactions.where(transaction_type: :deposit).sum(:price) - 
  	self.transactions.where(transaction_type: :withdrawal).sum(:price) -
  	self.transactions.where(transaction_type: :cash_back_out).sum(:price) -
  	self.transactions.where(transaction_type: :transfer_out).sum(:price) 
  end

end

