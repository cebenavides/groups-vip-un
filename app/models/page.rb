class Page < ApplicationRecord
	# For generating friendly routes
	extend FriendlyId
	friendly_id :title, use: :slugged
	
	belongs_to :group
	has_many :images
end
