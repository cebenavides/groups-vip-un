class Group < ApplicationRecord
	# For generating friendly routes
	extend FriendlyId
	friendly_id :name, use: :slugged

	# For attaching an image
	has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing_group.jpeg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  	# For having users, publications and pages
	has_many :users
	has_many :publications
	has_many :pages
end