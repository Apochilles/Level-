class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user=current_user.email
  end


  def not_found
      render plain: "not found"
  end
end
