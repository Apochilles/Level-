class RemoveDeveloperFromVideogames < ActiveRecord::Migration[6.0]
  def change

    remove_column :videogames, :developer, :string
  end
end
