class UsersController < ApplicationController
  def signup
  end
	
	def superlogin
	end

	def allusers
		if session[:user_id] != 2
			flash[:alert] = "Unauthorized attempts."
			redirect_to "/"
		else
			@users = User.order('created_at DESC').page(params[:page]).per(30)
		end
	end

	def userprofile
		@user = User.find(params[:id])
	end

	def userban
		user = User.find(params[:id])
		user.token = "goodbye"
		user.save
		flash[:alert] = "#{user.username} has been banned permanently."
		redirect_to "/"
	end

  def superlogin_complete
		if params[:username] != "supergentle"		
			flash[:alert] = "Super username or authorization key are wrong"
			redirect_to :back
		elsif params[:auth] != "0203idll"
			flash[:alert] = "Super username or authorization key are wrong"
			redirect_to :back
		else
			user = User.find(2)
			reset_session
			session[:user_id] = user.id
			flash[:alert] = "No one orders me around."
			redirect_to "/"
		end
  end

  def logout_complete
		reset_session
		flash[:alert] = "Successfully logged out."
		redirect_to "/"
  end

	def fb_login 
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
		flash[:alert] = "Successfully logged in."
    redirect_to "/"
	end
	
	def gosuper
		reset_session
		user = User.find(2)
		session[:user_id] = user.id
		flash[:alert] = "No one orders me around."
		redirect_to "/"
	end


end
