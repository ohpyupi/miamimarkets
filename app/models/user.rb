class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

	has_many :posts
	has_many :comments

	def self.omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

#	validates :username, :presence => { :message => "The username must be necessary!"}
#	validates :username, :uniqueness => { :message => "Already in use.", :case_sensitive => false}
#	validates :useremail, :presence => { :message => "The e-mail must be necessary!"}
#	validates :useremail, :uniqueness => { :message => "Already in use.", :case_sensitive => false}
#	validates :password, :length => { :minimum => 6, :too_short => "The pass word should be longer than 6 letters."}

end
