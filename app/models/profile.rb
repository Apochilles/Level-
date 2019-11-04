class Profile < ApplicationRecord
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  
  # validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }  
  # validates :phone_number, numericality: { :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  # :message => "- Phone numbers must be in xxx-xxx-xxxx format." } 
  

#   def completed_profile?
#     self.name.present? && self.address.present? && self.phone_number.present? && self.email.present? 
# end

end
