class DropEmailFieldfromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :email, :string
  end
end
