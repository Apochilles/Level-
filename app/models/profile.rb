class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  
  validates :name, presence: true, length: { minimum: 1, maximum: 20 , message: "Display name must be between: 20 - 500 characters" }
  
  validates :country,  presence: true

  validates :phone_number, presence: true, format: { with: /[0][4][4][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,
  message: "Mobile number must start with 04 and contain 10 numbers" }

end


# validates :country,
# :presence => { :in => 'country.nil?' }