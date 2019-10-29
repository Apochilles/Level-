class ProfileVideogame < ApplicationRecord
  belongs_to :videogame
  belongs_to :profile
end
