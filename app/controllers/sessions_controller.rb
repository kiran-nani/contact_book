class SessionsController < ApplicationController
  def new
  end

  def create
 		user = User.find_by(email: params[:session][:email].downcase)
 		if user && user.authenticate(params[:session][:password])
      log_in(user)
 			flash[:success] = "Hey!! #{user.name}, Welcome back"
 			redirect_to root_path
 		else
 			flash.now[:danger] = 'Invalid email/password combination'
 			render 'new'
 		end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end