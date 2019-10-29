class Videogame < ApplicationRecord
  belongs_to :user 
  validates :name, :developer, :system_req, :release_date, :average_rating, presence: true
end
