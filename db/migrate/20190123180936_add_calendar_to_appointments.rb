class AddCalendarToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :calendar, foreign_key: true
  end
end
