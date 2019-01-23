class ChangeStartTimeToBeDateinAppointments < ActiveRecord::Migration[5.2]
  def change
  	  change_column :appointments, :start_time, :date
  end
end
