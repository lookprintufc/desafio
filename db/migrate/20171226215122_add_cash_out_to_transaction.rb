class AddCashOutToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :cash_out, :boolean, default: false
  end
end
