class ChangeVideogame < ActiveRecord::Migration[6.0]
  def change
    remove_column :videogames, :publisher
  end
end
:videogames