class CreateProfileVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_videogames do |t|
      t.references :videogame, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
