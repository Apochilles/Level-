class Videogame < ApplicationRecord
  belongs_to :user 
  validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
