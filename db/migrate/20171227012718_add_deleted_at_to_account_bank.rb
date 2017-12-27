class AddDeletedAtToAccountBank < ActiveRecord::Migration[5.1]
  def change
    add_column :account_banks, :deleted_at, :datetime
    add_index :account_banks, :deleted_at
  end
end
