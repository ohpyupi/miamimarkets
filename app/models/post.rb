class Post < ActiveRecord::Base
	belongs_to :user
	has_many	:comments
	validates	:category, :inclusion => { :in => ["Rent/Housing", "Cars/Trucks", "Second hands", "Free topics"], :message => "Please choose a category over Rent/Housing, Cars/Trucks, Second hands, and Free topics."}
	validates :title, :presence => { :message => "The titie must be necessary"}
	mount_uploader :image, ImageUploader
end
