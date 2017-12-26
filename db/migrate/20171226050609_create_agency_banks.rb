class CreateAgencyBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :agency_banks do |t|
      t.integer :number_agency
      t.string :address

      t.timestamps
    end
  end
end
