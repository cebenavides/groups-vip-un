class Image < ApplicationRecord
	belongs_to :page

	# For attaching an image
	has_attached_file :file, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end