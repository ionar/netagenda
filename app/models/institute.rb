class Institute < ApplicationRecord
	validates :name, presence: true
	#scope :published, -> { where(published: true) }

	#scope :settings, -> {}
end
