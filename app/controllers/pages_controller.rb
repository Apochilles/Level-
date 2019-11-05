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
  #   session = Stripe::Checkout::Session.create(
  #     payment_method_types: ['card'],
  #     customer_email: current_user.email,
  #     line_items: [{
  #         currency: 'aud',
  #         quantity: 1,
  #     }],
  #     payment_intent_data: {
  #         metadata: {
  #             user_id: current_user.id,
  #         }
  #     },
  #     success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@.id}",
  #     cancel_url: "#{root_url}listings"
  # )
     
    @profiles = Profile.new
  end

  def create
 
  
      @profiles = Profile.new(profile_params)
      @profiles.user_id = current_user.id
      @profiles.email = current_user.email
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

# def subscription 
#   session = Stripe::Checkout::Session.create(
#     payment_method_types: ['card'],
#     customer_email: current_user.email,
#     line_items: [{
#         name: @profile.title,
#         currency: 'aud',
#         quantity: 1,
#     }],
#     payment_intent_data: {
#         metadata: {
#             user_id: current_user.id,
#             listing_id: @profile.id
#         }
#     },
#     success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@profile.id}",
#     cancel_url: "#{root_url}listings"
# )



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
 