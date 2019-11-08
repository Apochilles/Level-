class VideogamesController < ApplicationController
 #This method calls on set_listing in my private section of my controller. This method will be called before :show, :edit, :update, :destroy actions
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

#This method when called an instance variable that contains all my Videogame instances and sorts them by name 
  def index
      @videogames = Videogame.all.order("name")
  end

  #This method assigns a Videogame a Videogame_Id and provides connects it with the current user.profile to determine what privileges the user will have in the show page 
  def show
  id = params[ :id]
  @videogame = Videogame.find(id)
  @profile = current_user.profile
end

  #Calling new instances a new Videogame object and stores it in a videogame instance variable 
  def new
    @videogame = Videogame.new
  end

  
def create
  @videogame = Videogame.new ( videogame_params )
 
  @profile = current_user.profile
  if @videogame.save 
    ProfileVideogame.create(videogame_id: @videogame.id, profile_id: @profile.id, role: "uploader")


    
    redirect_to videogames_path


  else
    render :new
  end
end
 

  def edit
  end

  def destroy
    Videogame.find(params[:id]).destroy
    
    redirect_to videogames_path
  end
    

  def install
    @profile = current_user.profile
    @videogame = Videogame.find_by_id(params[:id]) 
    @profile_videogame = ProfileVideogame.create(videogame_id: @videogame.id, profile_id: @profile.id, role: "downloader")
  
    # require 'mailgun-ruby'

    # if @profile_videogame.save 
    #   ModelMailer.videogame_install_notification(@profile).deliver
    #   # respond_to do |format|
    #   # format.html {redirect_to videogame_path}
    #   # end
      redirect_to videogame_path
    # end
  end


  def update
    videogame_params = params.require(:videogame).permit(:name, :release_date, :average_rating, :genre_id, :developer_id, :description, :system_req, :picture) 
    id = params[:id]
      @videogame  = Videogame.find(id)
      if @videogame.update(videogame_params)
        redirect_to videogames_path
      else
        render :edit
      end
  
  end

  # def destroy
  #     #finish logic for deleting the record
  # end

  private

  def videogame_params  
  params.require(:videogame).permit(:name, :release_date, :average_rating, :genre_id, :developer_id, :description, :system_req, :picture) 
  end
    
     
  def set_listing
    id = params[:id]
      
    @videogame = Videogame.find(id)

    end
 
   def set_user_listing
     id = params[:id]
     @profile = current_user.profile
 
   end
 
 end