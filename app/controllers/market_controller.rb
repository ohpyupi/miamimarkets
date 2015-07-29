class MarketController < ApplicationController
	before_action :login_check
	skip_before_action :login_check, :only => [:posts, :posts_category, :show]

  def posts
		@posts = Post.all
  end

  def posts_category
		case params[:category]
		when "rent"
			@category = "Rent/Housing"
		when "car"
			@category = "Cars/Trucks"
		when "second"
			@category = "Second hands"
		else
			@category = "Free topics"
		end
		@posts = Post.where(category: @category)
  end

  def show
		@post = Post.find(params[:id])
		@comment_writer = User.where(id: session[:user_id])[0]
  end

  def write
  end

  def write_complete
		post = Post.new
		post.user_id = session[:user_id]
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.content = params[:post_content]
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
  end

  def edit_complete
		post = Post.find(params[:id])
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.content = params[:post_content]
		if post.save
			flash[:alert] = "Edited"
			redirect_to "/market/show/#{post.id}"
		else
			flash[:alert] = post.errors.values.flatten.join(' ')
			redirect_to :back
		end
  end

  def delete_complete
		post = Post.find(params[:id])
		post.destroy
		flash[:alert] = "Deleted"
		redirect_to "/"
  end

	def delete_comment_complete
		comment = Comment.find(params[:id])
		comment.destroy
		flash[:alert] = "The comment has been deleted."
		redirect_to "/market/show/#{comment.post_id}"
	end

end
