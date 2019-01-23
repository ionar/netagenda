class ChangeColumnNameInAppointments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :appointments, :start_time, :schedule_on
  end
end
