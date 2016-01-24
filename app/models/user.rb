class User < ActiveRecord::Base
	has_secure_password
	has_many :reports, dependent: :destroy
	
	validates :email, presence: true, 
	format: /\A\S+@\S+\z/, 
	uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 4, allow_blank: true }

	def self.authenticate(email, password)
  		user = User.find_by(email: email)
  		user && user.authenticate(password)
	end

end
