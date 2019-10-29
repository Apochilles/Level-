class AddUserToVideogame < ActiveRecord::Migration[6.0]
  def change
    add_reference :videogames, :user, null: false, foreign_key: true
  end
end
