class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :store_current_location, :unless => :devise_controller?
  
  private
  
    def store_current_location
      store_location_for(:user, request.url)
    end
  
    def is_admin?
      if current_user.try(:admin?)
      else
        redirect_to(root_path)
        flash[:danger] = "Must be admin to perform action"
      end
    end
end
