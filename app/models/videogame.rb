class Videogame < ApplicationRecord
  has_many :profile_videogames
  has_many :profiles, through: :profile_videogames
 
  belongs_to :genre 
  belongs_to :developer 
 
  validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
  
  validates :release_date, format: { with: /\d{2}\/\d{2}\/\d{4}/, message: "Date must be in the following format: dd/mm/yyyy" }

  validates :average_rating, inclusion:  {:in => [1,5], message: "Score must between: 1-5" }
  
  validates :genre_id, presence: true
  validates :developer_id, presence: true
  
  validates :description, presence: true, length: { minimum: 20, maximum: 300 , message: "Description must be between: 20 - 500 words" }

  validates :system_req, inclusion:  {:in => ["low","medium", "high"], message: "System requirements can only be low, medium or high" }

  

  accepts_nested_attributes_for :profile_videogames
  # validates :name, :developer_id, :system_req, :release_date, :average_rating, presence: true
end
