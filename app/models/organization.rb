class Organization < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
  	has_many :users, through: :memberships
	has_many :reports, dependent: :destroy



	def members
		
	end


end