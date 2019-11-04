class RenameAddresstoCountry < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :address, :country 
  end
end
