class Group < ApplicationRecord
	# For generating friendly routes
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	# For attaching an image
	has_attached_file :avatar, styles: { medium: "300x300#" }, default_url: "/images/:style/missing_group.jpeg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  	# For having users, publications and pages
	has_many :users
	has_many :publications
	has_many :pages
	
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