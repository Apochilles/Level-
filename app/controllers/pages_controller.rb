class PagesController < ApplicationController
#The devise gem restricts my users to create, update, and delete methods via the application_controller to only users that are signed in.
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
    
  def home
    @user=current_user.email
  end

  #This method evaluates whether the current_user.profile matches the profile they are viewing. If not, it redirects them.

  def show
    if current_user.profile != Profile.find(params[:id])
      redirect_to root_path
    end
  end 

#This method creates a new instance of a profile and stores it in a profile instance variable and permits fields as allowed by profile_params. ii then assigns the connected user_id as a foreign key. If the information is invalid it reloads the form otherwise it creates a Profile and redirects the user to the subscription page
  
  def new
     @profile = current_user.Profile.new(profile_params)
  end

  def create
      @profile = Profile.new(profile_params)
      @profile.user_id = current_user.id
      if @profile.save
      redirect_to videogames_path
      else render :new
      end
  end

  
#This method finds a profile by id and allows the user to edit permited fields as allowed by profile_params. If the information is invalid it reloads the form otherwise it updates and redirects the user to the videogame index page


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


  def not_found
      render plain: "not found"
  end


  private

   #This method takes determines what fields are permitted when creating or editing a profile. 

  def profile_params  
   params.require(:profile).permit(:name, :country, :phone_number, :picture )  
  end
 
     #This method determines the current id of the profile when on the show or edit page.
  
  def set_listing
    id = params[:id]
      
    @profile = Profile.find(id)


  end

   #This method determines the current id of the user when on the show or edit page and determines what user is logged in. If the profile id does not match the profile id then the user is not permitted and is redirected to index page  
 
   def set_user_listing
     id = params[:id]
     @profile = current_user.profile
 
     if @profile == nil
      redirect_to root_path
      end
   
    end
 
 end
 