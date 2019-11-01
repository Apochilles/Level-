class ApplicationController < ActionController::Base
  def after_registration_path(resource_name)
    redirect_to edit_listings_path
  end
end
