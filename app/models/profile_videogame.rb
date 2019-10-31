class ProfileVideogame < ApplicationRecord
  belongs_to :profile
  belongs_to :videogames
  has_one :profile
  has_many :videogames
end
