class ChangingVideogameId < ActiveRecord::Migration[6.0]
  def change
    
    change_column_null :profile_videogames, :videogame_id, true
    
  end
end
