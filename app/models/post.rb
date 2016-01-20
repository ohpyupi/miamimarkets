class Post < ActiveRecord::Base
	belongs_to :user
	has_many	:comments, :dependent => :destroy
	has_many	:pictures, :dependent => :destroy

	validates	:category, :inclusion => { :in => ["Notice","Rent/Housing", "Cars/Trucks", "Second hands", "Bicycles","Free topics"], :message => "Please choose a category over Rent/Housing, Cars/Trucks, Bicycles, Second hands, and Free topics."}
	validates :title, :presence => { :message => "The titie must be necessary"}
#	validates :content, :presence => { :message => "The content must be necessary"}

	mount_uploader :image, ImageUploader

	def self.search(search)
		where("title LIKE ?", "%#{search}%")
	end

end
