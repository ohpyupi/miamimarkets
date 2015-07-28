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
  end

  def edit
  end

  def edit_complete
  end

  def delete_complete
  end
end
