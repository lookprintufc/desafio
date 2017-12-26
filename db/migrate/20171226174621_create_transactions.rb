class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account_bank_id
      t.float :price
      t.integer :transaction_type
      t.integer :user_id
      t.timestamps
    end
    #index
    add_index :transactions, :account_bank_id
  end
end
