class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  
  validates :name, presence: true, length: { minimum: 1, maximum: 20 , message: "Display name must be between: 20 - 500 characters" }
  # validates :phone_number, numericality: { :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  # :message => "- Phone numbers must be in xxx-xxx-xxxx format." }
  validates :country, presence: true

#   def completed_profile?
#     self.name.present? && self.address.present? && self.phone_number.present? && self.email.present? 
# end
accepts_nested_attributes_for :user

end
