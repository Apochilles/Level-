class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates_associated :user
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  

  def completed_profile?
    self.name.present? && self.address.present? && self.phone_number.present? && self.email.present? 
end

end
