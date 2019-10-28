class ChangeProfile < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :phone, :phone_number 
    remove_column :profiles, :number
  end
end
