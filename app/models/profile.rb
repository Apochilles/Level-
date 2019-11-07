class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  
  validates :name, presence: true, length: { minimum: 1, maximum: 20 , message: "Display name must be between: 20 - 500 characters" }
  validates :country, presence: true
  # validates :phone_number, presence: true ,format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }



end
