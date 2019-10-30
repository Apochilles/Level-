class ProfileVideogame < ApplicationRecord
  belongs_to :profiles
  has_many :profiles
  has_many :videogames
end
