class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates_associated :user
  has_many :profile_videogames
  has_many :videogames, through: :profile_videogames
  has_one_attached :picture

  
  validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }  
  validates :phone_number, numericality: { :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  :message => "- Phone numbers must be in xxx-xxx-xxxx format." } 
  # validates :email, presence: true

  validates :address, inclusion:  {:in => [1,5], message: "Score must between: 1-5" }
  

#   def completed_profile?
#     self.name.present? && self.address.present? && self.phone_number.present? && self.email.present? 
# end

end
