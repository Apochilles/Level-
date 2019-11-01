class ProfileVideogame < ApplicationRecord
  belongs_to :profile
  belongs_to :videogames
end
