class Videogame < ApplicationRecord
  has_many :profile_videogames
  has_many :profiles, through: :profile_videogames
 
  belongs_to :genre 
  belongs_to :developer 
 
  accepts_nested_attributes_for :profile_videogames
  # validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
