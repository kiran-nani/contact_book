module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def user_logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def redirect_back_or(default)
  	redirect_to(session[:return_to] || default)
  	session.delete(:return_to)
	end 
end
