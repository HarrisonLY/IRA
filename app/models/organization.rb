class Organization < ActiveRecord::Base
	has_many :members
  	has_many :users, through: :members
	has_many :reports, as: :reportable, dependent: :destroy



end