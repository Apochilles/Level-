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
    @profiles = Profile.new
  end

  def create
 
  
      @profiles = Profile.new(profile_params)
      @profiles.user_id = current_user.id
      @profiles.save
      redirect_to root_path
 
end

def update 
  listing_params = params.require(:profile).permit(:name, :country, :phone_number, :email, :picture)
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
   params.require(:profile).permit(:name, :country, :phone_number, :email, :picture )  
  end
 
      
  def set_listing
    id = params[:id]
      
    @profiles= Profile.find(id)

    end
 
   def set_user_listing
     id = params[:id]
     @profile = current_user.profile
 
     if @profile == nil
      redirect_to root_path
      end
   
    end
 
 end
 