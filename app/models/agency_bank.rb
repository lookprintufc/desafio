class AgencyBank < ApplicationRecord
  #VALIDACOES
  validates :number_agency, presence: true, uniqueness: true,
    format: { with: /\A\d+\z/, message: "deve ser somente números." }
  validates :address, presence: true

  has_many :account_banks
  acts_as_paranoid
end
