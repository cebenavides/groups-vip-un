class Page < ApplicationRecord
	# For generating friendly routes
	extend FriendlyId
	friendly_id :title, use: :slugged
	
	belongs_to :group
	has_many :images
	
	# For limiting the length of the slug
	def normalize_friendly_id(string)
	  super[0..33]
	end
end