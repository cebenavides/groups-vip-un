class Page < ApplicationRecord
	belongs_to :group
	has_many :images
end
