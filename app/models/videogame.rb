class Videogame < ApplicationRecord
  has_many :profile_videogames
  has_many :profiles, through: :profile_videogames
 
  belongs_to :genre 
  belongs_to :developer 
 
  validates :name, presence: true, length: { minimum: 1, maximum: 5 , message: "Name must be between: 1 and 5 characters" }
  # validates :release_date, format: { with: /\d{2}\/\d{2}\/\d{4}/, message: "Date must be in the following format: dd/mm/yyyy" }

  validates :average_rating, inclusion:  {:in => (1..5), message: "Score must between: 1-5" }
  
  validates :genre_id, presence: true
  validates :developer_id, presence: true
  
  validates :description, presence: true, length: { minimum: 20, maximum: 300 , message: "Description must be between: 20 - 500 characters" }

  validates :system_req, inclusion:  {:in => %w(Low Medium High), message: "System requirements can only be Low, Medium or High" }

  

  accepts_nested_attributes_for :profile_videogames
  # validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
