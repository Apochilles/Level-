class AddProfileToVideogame < ActiveRecord::Migration[6.0]
  def change
    add_reference :videogames, :profile, null: false, foreign_key: true
  end
end
