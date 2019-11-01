class RemoveProfilefromVideogames < ActiveRecord::Migration[6.0]
  def change
    remove_column :videogames, :profile_id, :bigint
  end
end
