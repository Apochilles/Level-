class ProfileVideogame < ApplicationRecord
  belongs_to :videogame
  belongs_to :profile
  has_many :profile
  has_many :videogames
end
