class MarketController < ApplicationController
	before_action :login_check, :ban_check
	skip_before_action :login_check, :only => [:about, :posts, :posts_category, :show]

  def posts
		@posts = Post.order('created_at DESC').page(params[:page]).per(10)
  end

	def about
	end

	def search
		@posts = Post.search(params[:search]).order('created_at DESC').page(params[:page]).per(10)
	end

  def posts_category
		case params[:category]
		when "notice"
			@category = "Notice"
		when "rent"
			@category = "Rent/Housing"
		when "car"
			@category = "Cars/Trucks"
		when "bicycles"
			@category = "Bicycles"
		when "second"
			@category = "Second hands"
		else
			@category = "Free topics"
		end
		@posts = Post.where(category: @category).order('created_at DESC').page(params[:page]).per(10)
  end

  def show
		@post = Post.find(params[:id])
		@comment_writer = User.where(id: session[:user_id])[0]
  end
	
	def myposts
		@posts = Post.where(user_id: session[:user_id]).order('created_at DESC').page(params[:page]).per(10)
	end

  def write
  end

  def write_complete
		post = Post.new
		post.user_id = session[:user_id]
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.content = params[:post_content]
		post.image = params[:image]
		if post.save
			flash[:alert] = "Saved"
			redirect_to "/market/show/#{post.id}"
		else
			flash[:alert] = post.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end
	
	def write_comment_complete
		comment = Comment.new
		comment.user_id = session[:user_id]
		comment.post_id = params[:post_id]
		comment.content = params[:comment_content]
		comment.save

		flash[:alert] = "New comment has been added."
		redirect_to "/market/show/#{comment.post_id}"
	end

  def edit
		@post = Post.find(params[:id])
		if @post.user_id != session[:user_id]
			flash[:alert] = "You are not authorized."
			redirect_to :back
		end
  end

  def edit_complete
		post = Post.find(params[:id])
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.content = params[:post_content]
		post.image = params[:image]
		if post.save
			flash[:alert] = "Edited"
			redirect_to "/market/show/#{post.id}"
		else
			flash[:alert] = post.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end

  def delete_complete
		@current_user = User.where(id: session[:user_id])[0]
		post = Post.find(params[:id])
		if post.user_id == session[:user_id] || @current_user.usertype == 2
			post.destroy
			flash[:alert] = "Deleted"
			redirect_to "/"
		else
			flash[:alert] = "You are not authorized."
			redirect_to :back
		end
  end

	def delete_comment_complete
		@current_user = User.where(id: session[:user_id])[0]
		comment = Comment.find(params[:id])
		if comment.user_id == session[:user_id] || @current_user.usertype == 2
			comment.destroy
			flash[:alert] = "The comment has been deleted."
			redirect_to "/market/show/#{comment.post_id}"
		else
			flash[:alert] = "You are not authorized."
			redirect_to :back
		end
	end

end
