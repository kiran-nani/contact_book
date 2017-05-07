class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  	def logged_in_user
  		unless user_logged_in?
  			store_location
  			flash[:danger] = "Please Login"
  			redirect_to login_path
  		end
  	end
end
