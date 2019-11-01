class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  def home
    @user=current_user.email
  end

  def show
  end 

  def new
  end

  def create
    listing_params = params.require(:profiles).permit(:name, :address, :phone_number, :email )

  @profiles = Profile.new ( profile_params )
  @profiles = current_user.listings.create( listing_params )
  if @profiles.save 
    redirect_to @home
  else
    render :new
  end
end

def update 
  listing_params = params.require(:profile).permit(:name, :address, :phone_number, :email )
  id = params[:id]
    @profiles = Profile.find(id)
    if @profiles.update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
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
     @profile = current_user.profile
 
   end
 
 end
 