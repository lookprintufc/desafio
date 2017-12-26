class AddDestinationToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :destination_account_bank_id, :integer
  end
end
