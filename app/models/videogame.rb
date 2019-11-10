class Videogame < ApplicationRecord
  require 'date'
  
  has_many :profile_videogames, dependent: :nullify 
  has_many :profiles, through: :profile_videogames
  belongs_to :genre
  belongs_to :developer
  has_one_attached :picture

  validates :name, presence: true, length: { minimum: 1, maximum: 40 , message: "must be between: 1 and 40 characters" }
  validates :average_rating, presence: true
  validates :release_date, presence: true
  validate :release_date_cannot_be_in_the_future 
  def release_date_cannot_be_in_the_future
    errors.add(:release_date, "can't be in the future") if
      !release_date.blank? and release_date.to_date > Date.today 
  end    
  validates :genre_id, presence: true
  validates :developer_id, presence: true
  validates :description, presence: true, length: { minimum: 20, maximum: 300 , message: "must be between: 20 and 500 characters" }
  validates :system_req, presence: true

  accepts_nested_attributes_for :profile_videogames

  #Sets a default scope of name ascending which I use to sort my videogame index page
  default_scope { order("name ASC") }

 
end