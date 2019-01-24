class Calendar < ApplicationRecord
	has_many :appointments, dependent: :destroy
end
