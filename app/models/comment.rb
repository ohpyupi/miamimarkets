class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	validates :content, :presence => { :message => "The content must be necessary!"}
end
