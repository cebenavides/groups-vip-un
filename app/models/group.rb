class Group < ApplicationRecord
	# For generating friendly routes
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

  	# For having users, publications, images and pages
	has_many :users, dependent: :destroy
	has_many :publications, dependent: :destroy
	has_many :pages, dependent: :destroy
	has_many :group_images, dependent: :destroy
	
	# For limiting the length of the slug
	def normalize_friendly_id(string)
	  super[0..33]
	end
	
	def should_generate_new_friendly_id?
		name_changed? || super
	end
	
	def slug_candidates
		[
	      :name,
	      [:name, :id]
	    ]
	end
	
end