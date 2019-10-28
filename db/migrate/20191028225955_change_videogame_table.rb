class ChangeVideogameTable < ActiveRecord::Migration[6.0]
  def change
    add_column :videogames, :name, :string
  end
end
