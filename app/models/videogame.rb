class Videogame < ApplicationRecord
  
  belongs_to :user 
  has_one :genre 
  has_one :developer 
  
  validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
