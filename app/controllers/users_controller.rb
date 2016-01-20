class UsersController < ApplicationController

	before_action	:agent_check, :only => [:superlogin, :superlogin_complete]
	before_action :super_check, :only => :allusers

  def signup
  end
	
	def superlogin
	end

	def allusers
			@users = User.order('created_at DESC').page(params[:page]).per(30)
	end

	def userprofile
		@user = User.find(params[:id])
	end

	def userban
		user = User.find(params[:id])
		user.usertype = 9
		user.save
		flash[:alert] = "#{user.username} has been banned permanently."
		redirect_to "/users/allusers"
	end

	def userunban
		user = User.find(params[:id])
		user.usertype = 0
		user.save
		flash[:alert] = "#{user.username} has been neutralized"
		redirect_to "/users/allusers"
	end

	def useragent
		user = User.find(params[:id])
		user.usertype = 1
		user.save
		flash[:alert] = "#{user.username} is declared to be your agent."
		redirect_to "/users/allusers"
	end


  def superlogin_complete
		if params[:username] != "supergentle"		
			flash[:alert] = "Super username or authorization key are wrong"
			redirect_to :back
		elsif params[:auth] != "goldjade"
			flash[:alert] = "Super username or authorization key are wrong"
			redirect_to :back
		else
			reset_session
			user = User.where(usertype: 2)[0]
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
	

end
