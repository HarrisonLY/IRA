class Organization < ActiveRecord::Base
	has_many :organizations_users
  	has_many :users, through: :organizations_users
	has_many :reports, as: :reportable, dependent: :destroy



end