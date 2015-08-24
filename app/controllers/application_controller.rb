class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	  protect_from_forgery with: :exception
end

def login_check
	@current_user = nil
	if !session[:user_id].nil?
		@current_user = User.find(session[:user_id])
	else
		redirect_to "/auth/facebook"
	end
end

def ban_check
	@ban_check = nil
	if !session[:user_id].nil?
		@ban_user = User.where(id: session[:user_id])[0]
		if @ban_user.usertype == 9
		reset_session
		flash[:alert] = "I'm sorry, #{@ban_user.username}. Your ID's been permanently banned."
		redirect_to "/"
		end
	end
end
