class User < ActiveRecord::Base
	has_many :reports, as: :reportable, dependent: :destroy
	has_many :organizations_users
  	has_many :organizations, through: :organizations_users

	has_secure_password

	validates :email, presence: true, 
	format: /\A\S+@\S+\z/, 
	uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 4, allow_blank: true }

	def self.authenticate(email, password)
  		user = User.find_by(email: email)
  		user && user.authenticate(password)
	end

end
