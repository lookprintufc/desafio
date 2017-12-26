class CreateAccountBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :account_banks do |t|
      t.integer :agency_bank_id
      t.integer :number_account
      t.float :limit
      t.timestamps
    end
    #index
    add_index :account_banks, :agency_bank_id
  end
end
