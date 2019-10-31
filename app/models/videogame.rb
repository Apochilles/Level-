class Videogame < ApplicationRecord
  belongs_to :profile
  has_many :profile_videogames
  has_many :profiles,  through: :profile_videogame
  belongs_to :genre 
  belongs_to :developer 
 
  
  # validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
