class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	validates :username, :presence => { :message => "The username must be necessary!"}
	validates :username, :uniqueness => { :message => "Already in use.", :case_sensitive => false}
	validates :useremail, :presence => { :message => "The e-mail must be necessary!"}
	validates :useremail, :uniqueness => { :message => "Already in use.", :case_sensitive => false}
	validates :password, :length => { :minimum => 6, :too_short => "The pass word should be longer than 6 letters."}
	
end
