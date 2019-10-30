class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :videogames, through: :profile_videogames 

end
