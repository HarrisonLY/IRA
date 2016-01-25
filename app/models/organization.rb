class Organization < ActiveRecord::Base
	has_many :users
	has_many :reports, through: :users

end
