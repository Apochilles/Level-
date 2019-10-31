class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user=current_user.email
  end

  def show
  end 


  def not_found
      render plain: "not found"
  end


private

 def profile_params  
  params.require(:profile).permit(:name, :address, :phone_number, :email )  
 end
    
  def set_listing
    id = params[:id]
      @profiles= Profile.find(id)
  end

  def set_user_listing
    id = params[:id]
    @profile = current_user.profiles.find_by_id(id)

  end

end
