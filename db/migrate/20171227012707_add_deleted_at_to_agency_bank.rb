class AddDeletedAtToAgencyBank < ActiveRecord::Migration[5.1]
  def change
    add_column :agency_banks, :deleted_at, :datetime
    add_index :agency_banks, :deleted_at
  end
end
