class Appointment < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :calendar
  has_and_belongs_to_many :services

  validates :name, :duration, presence: true

  scope :para_o_calendar, -> (calendario) { where calendar_id: calendario }

  scope :para_o_dia, -> (dia) { where schedule_on: dia }


  	def appointment_time_only format = "%H:%M"
   		appointment_time.strftime(format) if appointment_time.present?
	end

	#simple_calendar find column "start_time". Here set a nickname
  	def start_time
    	self.schedule_on
	end
end
