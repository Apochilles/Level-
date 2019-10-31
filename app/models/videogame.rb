class Videogame < ApplicationRecord
  belongs_to :user,  optional: true
  has_many :users,  through: :profile_videogame
  belongs_to :genre 
  belongs_to :developer 
  belongs_to :profile
  
  # validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
