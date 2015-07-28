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
  end

  def logout_complete
  end
end
