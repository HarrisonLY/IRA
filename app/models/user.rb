class User < ActiveRecord::Base
	has_many :reports, as: :reportable, dependent: :destroy
	has_many :members
  	has_many :organizations, through: :members

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
