class UsersController < ApplicationController
  def signup
  end

  def signup_complete
		user = User.new
		user.username = params[:username]
		user.useremail = params[:useremail]
		if params[:password] == params[:retype_password]
			user.password = params[:password]
			if user.save
				flash[:alert] = "Successfully signed up"
				redirect_to "/"
			else
				flash[:alert] = user.errors.values.flatten.join('')
				redirect_to :back
			end
		else
			flash[:alert] = "The passwords do not match up."
			redirect_to :back
		end
  end

  def login
  end

  def login_complete
		user = User.where(username: params[:username])[0]
		if user.nil?
			flash[:alert] = "Please, check your username or password."
			redirect_to :back
		elsif user.password != params[:password]
			flash[:alert] = "Please, check your username or password."
			redirect_to :back
		else
			session[:user_id] = user.id
			flash[:alert] = "Successfully logged in."
		redirect_to "/"
		end
  end

  def logout_complete
		reset_session
		flash[:alert] = "Successfully logged out."
		redirect_to "/"
  end
end
