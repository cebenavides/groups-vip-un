class Group < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :users
end