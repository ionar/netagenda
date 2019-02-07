class Client < ApplicationRecord
	validates :name, presence: true
	has_many :appointments, dependent: :nullify
end
