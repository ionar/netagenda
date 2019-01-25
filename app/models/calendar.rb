class Calendar < ApplicationRecord
	has_many :appointments, dependent: :nullify
	has_many :users, dependent: :nullify
end
