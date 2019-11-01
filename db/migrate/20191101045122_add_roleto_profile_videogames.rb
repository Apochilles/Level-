class AddRoletoProfileVideogames < ActiveRecord::Migration[6.0]
  def change
    add_column :profile_videogames, :role, :string
  end
end
