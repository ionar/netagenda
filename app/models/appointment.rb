class Appointment < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :services


  	def appointment_time_only format = "%H:%M"
   		appointment_time.strftime(format) if appointment_time.present?
	end

	#simple_calendar find column "start_time". Here set a nickname
  	def start_time
    	self.schedule_on
	end
end
