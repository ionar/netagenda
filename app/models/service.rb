class Service < ApplicationRecord
	has_and_belongs_to_many :appointments, dependent: :delete_all
end
