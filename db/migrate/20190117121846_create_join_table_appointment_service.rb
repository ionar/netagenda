class CreateJoinTableAppointmentService < ActiveRecord::Migration[5.2]
	def change
		create_join_table :appointments, :services do |t|
	  		t.index [:appointment_id, :service_id]
		end
	end
end
