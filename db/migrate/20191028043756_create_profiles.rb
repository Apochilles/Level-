class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :number
      t.string :email

      t.timestamps
    end
  end
end
