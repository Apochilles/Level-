class CreateVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :videogames do |t|
      t.string :developer
      t.string :publisher
      t.string :system_req
      t.string :release_date
      t.integer :average_rating

      t.timestamps
    end
  end
end
