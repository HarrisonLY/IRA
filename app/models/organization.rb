class Organization < ActiveRecord::Base
	has_many :memberships
  	has_many :users, through: :memberships
	has_many :reports, as: :reportable, dependent: :destroy



end