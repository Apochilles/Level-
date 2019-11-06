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
    @profile = Profile.new
  end

  def create
      @profile = Profile.new(profile_params)
      @profile.user_id = current_user.id
      @profile.email = current_user.email
      if @profile.save
      redirect_to videogames_path
      else render :new
      end
  end

def update 
  listing_params = params.require(:profile).permit(:name, :country, :phone_number, :email, :picture)
  id = params[:id]
    @profile = Profile.find(id)
    if @profile.update(profile_params)
      redirect_to videogames_path
    else
      render :edit
    end
end

def destroy
  Profile.find(params[:id]).destroy
  
  redirect_to root_path
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
      
    @profile = Profile.find(id)

    end
 
   def set_user_listing
     id = params[:id]
     @profile = current_user.profile
 
     if @profile == nil
      redirect_to root_path
      end
   
    end
 
 end
 