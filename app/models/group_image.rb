class GroupImage < ApplicationRecord
    belongs_to :group

	# For attaching an image
	has_attached_file :avatar, styles: { medium: "300x300#" }, default_url: "/images/:style/missing_group.jpeg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
