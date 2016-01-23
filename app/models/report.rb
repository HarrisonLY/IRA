class Report < ActiveRecord::Base

validates :title, presence: true
validates :slug, presence: true

before_validation :generate_slug

def to_param
  slug
end

def generate_slug
  self.slug ||= created_at.strftime("%m-%d-%Y").parameterize if created_at
end

end
