class MarketController < ApplicationController
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
  end

  def write
  end

  def write_complete
		post = Post.new
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
end
