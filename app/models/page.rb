class Page < ApplicationRecord
	# For generating friendly routes
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
	
	belongs_to :group
	has_many :images
	
	# For limiting the length of the slug
	def normalize_friendly_id(string)
	  super[0..20]
	end
	
	def should_generate_new_friendly_id?
		title_changed? || super
	end
	
	def slug_candidates
		[
	      :title,
	      [:title, :id]
	    ]
	end
end