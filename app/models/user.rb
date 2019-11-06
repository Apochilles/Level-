class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_create :build_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
#  validates :email, uniqueness: true
 has_one :profile, dependent: :destroy




        
         

end
