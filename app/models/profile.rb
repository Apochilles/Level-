class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  
  validates :name, presence: true, length: { minimum: 1, maximum: 20 , message: "must be between: 20 - 500 characters" }
  
  validates :country, presence: true, inclusion:  {:in => %w(Australia UK USA China Japan Germany Other), message:  "avaliable are only Australia, UK, USA, China, Japan or Germany. If other, put Other" }

  validates :phone_number, presence: true, format: { with: /[0][4][4][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/,
  message: " must start with 044 and contain 10 numbers" }

end


# validates :country,
# :presence => { :in => 'country.nil?' }