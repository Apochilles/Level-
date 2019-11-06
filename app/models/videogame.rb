class Videogame < ApplicationRecord
  has_many :profile_videogames, dependent: :nullify 
  has_many :profiles
  has_many :profiles, through: :profile_videogames
  belongs_to :genre
  belongs_to :developer
  has_one_attached :picture

  
 
#   validates :name, presence: true, length: { minimum: 1, maximum: 10 , message: "Game name must be between: 1 and 10 characters" }
  
#   validates :average_rating, inclusion:  {:in => (1..5), message: "Score must between: 1-5" }
  
#   validates :genre_id, presence: true
  
#   validates :developer_id, presence: true
  
#   validates :description, presence: true, length: { minimum: 20, maximum: 300 , message: "Description must be between: 20 and 500 characters" }

#   validates :system_req, inclusion:  {:in => %w(Low Medium High), message: "System requirements can only be Low, Medium or High" }

#   accepts_nested_attributes_for :profile_videogames

#Scope methods

default_scope { order("name ASC") }
# scope :name = { order(name: :ASC) }
# scope :system_req -> { order(system_req: >= :ASC) }
# scope :release_date -> { order('release_date: >= ASC') }
# scope :average_rating -> { order('average_rating: >= ASC') }
# scope :developer_name -> { order('developer_name: >= ASC') }
# scope :genre_description -> { order('genre_description: >= ASC') }

end